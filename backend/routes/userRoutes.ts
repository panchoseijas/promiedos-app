import { Router, Request, Response } from "express";
import prisma from "../prisma/client";
import { fetchData } from "../prisma/fillDB";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { body, validationResult } from "express-validator";

const router = Router();

router.put("/update", async (req: Request, res: Response) => {
  const {
    id: userId,
    email,
    username,
    followedTeams,
    followedCompetitions,
  } = req.body;

  try {
    const updatedUser = await prisma.user.update({
      where: { id: parseInt(userId) },
      data: {
        email,
        username,
        followedTeams: {
          set: followedTeams.map(({ id }: { id: string }) => ({
            id: id,
          })),
        },
        followedCompetitions: {
          set: followedCompetitions.map(({ id }: { id: string }) => ({
            id: id,
          })),
        },
      },
      include: {
        followedTeams: {
          select: { id: true },
        },
        followedCompetitions: {
          select: { id: true },
        },
      },
    });

    const { password, ...userWithoutPassword } = updatedUser;

    res.json(userWithoutPassword);
  } catch (error: any) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});

router.put(
  "/update/profile",
  [
    body("email").isEmail().withMessage("Invalid email address"),
    body("username")
      .isLength({ min: 3 })
      .withMessage("Username must have at least 3 characters"),
  ],
  async (req: Request, res: Response) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.status(400).json({ message: errors.array(), field: "email" });
      return;
    }
    console.log("llego body:", req.body);
    const { id: userId, username, password } = req.body;
    const email = req.body.email.toLowerCase();
    try {
      const userWithSameEmail = await prisma.user.findFirst({
        where: {
          email,
          NOT: { id: parseInt(userId) },
        },
      });
      if (userWithSameEmail) {
        res
          .status(409)
          .json({ message: "Email already taken", field: "email" });
        return;
      }

      const userWithSameUsername = await prisma.user.findFirst({
        where: {
          username,
          NOT: { id: parseInt(userId) },
        },
      });

      if (userWithSameUsername) {
        res
          .status(409)
          .json({ message: "Username already exists", field: "username" });
        return;
      }

      if (password) {
        const hashedPassword = bcrypt.hashSync(password, 10);
        await prisma.user.update({
          where: { id: parseInt(userId) },
          data: {
            password: hashedPassword,
          },
        });
      }

      const updatedUser = await prisma.user.update({
        where: { id: parseInt(userId) },
        data: {
          email,
          username,
        },
        include: {
          followedTeams: {
            select: { id: true },
          },
          followedCompetitions: {
            select: { id: true },
          },
        },
      });

      const { password: _, ...userWithoutPassword } = updatedUser;

      res.json(userWithoutPassword);
    } catch (error: any) {
      console.error(error);
      res.status(500).json({ error: error.message });
    }
  }
);

export default router;
