import { Router, Request, Response } from "express";
import prisma from "../prisma/client";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { body, validationResult } from "express-validator";
const router = Router();

router.post(
  "/register",
  [
    body("email").isEmail().withMessage("Invalid email address"),
    body("username")
      .isLength({ min: 3 })
      .withMessage("Username must have at least 3 characters"),
    body("password")
      .isLength({ min: 6 })
      .withMessage("Password must be at least 6 characters long")
      .matches(/[A-Z]/)
      .withMessage("Password must have at least one uppercase letter")
      .matches(/\d/)
      .withMessage("Password must have at least one number"),
  ],
  async (req: Request, res: Response) => {
    const { email, username, password } = req.body;
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({ errors: errors.array() });
      return;
    }

    try {
      const userExists = await prisma.user.findFirst({
        where: {
          OR: [{ email }, { username }],
        },
      });
      if (userExists) {
        res
          .status(409)
          .json({ message: "User already exists", field: "username" });
        return;
      }

      const user = await prisma.user.create({
        data: {
          email,
          username,
          password: bcrypt.hashSync(password, 10),
        },
      });
      res.json(user);
    } catch (e: any) {
      console.error(e);
      res.json({ error: e.message });
    }
  }
);

router.post("/login", async (req: Request, res: Response) => {
  const { email, password } = req.body;
  const lowerCaseEmail = email.toLowerCase();
  try {
    const user = await prisma.user.findFirst({
      where: {
        email: lowerCaseEmail,
      },
      include: {
        followedTeams: {
          select: { id: true },
        },
        followedCompetitions: { select: { id: true } },
      },
    });

    if (!user) {
      res.status(404).json({ message: "User not found" });
      return;
    }

    const passwordMatch = bcrypt.compareSync(password, user.password);
    if (!passwordMatch) {
      res.status(401).json({ message: "Invalid password" });
      return;
    }

    const { password: _, ...userWithoutPassword } = user;

    const token = jwt.sign(userWithoutPassword, process.env.JWT_SECRET!, {
      expiresIn: "2w",
    });

    res.json({ token });
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.post("/check-password", async (req: Request, res: Response) => {
  const { userId, password } = req.body;
  try {
    const user = await prisma.user.findFirst({
      where: {
        id: userId,
      },
    });

    if (!user) {
      res.status(404).json({ message: "User not found" });
      return;
    }

    const passwordMatch = bcrypt.compareSync(password, user.password);
    if (!passwordMatch) {
      res.status(401).json({ message: "Invalid password" });
      return;
    }

    res.status(200).json({ message: "Password is correct" });
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});
export default router;
