import { Router, Request, Response } from "express";
import prisma from "../prisma/client";

const router = Router();

// could be competition or team id
router.post("/team/:teamId", async (req: Request, res: Response) => {
  const { teamId } = req.params;
  const { userId } = req.body;
  try {
    const updatedUser = await prisma.user.update({
      where: { id: parseInt(userId) },
      data: {
        followedTeams: {
          connect: { id: teamId },
        },
      },
      include: {
        followedTeams: {
          select: { id: true },
        },
        followedCompetitions: { select: { id: true } },
      },
    });
    const { password, ...userWithoutPassword } = updatedUser;

    res.json(userWithoutPassword);
  } catch (error: any) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});

router.delete("/team/:teamId", async (req: Request, res: Response) => {
  const { teamId } = req.params;
  const { userId } = req.body;
  console.log("DEELTE /team/:teamId", teamId, userId);
  try {
    const updatedUser = await prisma.user.update({
      where: { id: parseInt(userId) },
      data: {
        followedTeams: {
          disconnect: { id: teamId },
        },
      },
      include: {
        followedTeams: {
          select: { id: true },
        },
        followedCompetitions: { select: { id: true } },
      },
    });
    const { password, ...userWithoutPassword } = updatedUser;

    res.json(userWithoutPassword);
  } catch (error: any) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});

router.post(
  "/competition/:competitionId",
  async (req: Request, res: Response) => {
    const { competitionId } = req.params;
    const { userId } = req.body;
    try {
      const updatedUser = await prisma.user.update({
        where: { id: parseInt(userId) },
        data: {
          followedCompetitions: {
            connect: { id: competitionId },
          },
        },
        include: {
          followedTeams: {
            select: { id: true },
          },
          followedCompetitions: { select: { id: true } },
        },
      });
      const { password, ...userWithoutPassword } = updatedUser;

      res.json(userWithoutPassword);
    } catch (error: any) {
      console.error(error);
      res.status(500).json({ error: error.message });
    }
  }
);

router.delete(
  "/competition/:competitionId",
  async (req: Request, res: Response) => {
    const { competitionId } = req.params;
    const { userId } = req.body;
    console.log("DELETE /competition/:competitionId", competitionId, userId);

    try {
      const updatedUser = await prisma.user.update({
        where: { id: parseInt(userId) },
        data: {
          followedCompetitions: {
            disconnect: { id: competitionId },
          },
        },
        include: {
          followedTeams: {
            select: { id: true },
          },
          followedCompetitions: { select: { id: true } },
        },
      });
      const { password, ...userWithoutPassword } = updatedUser;

      res.json(userWithoutPassword);
    } catch (error: any) {
      console.error(error);
      res.status(500).json({ error: error.message });
    }
  }
);
export default router;
