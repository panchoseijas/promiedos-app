import { Router, Request, Response } from "express";
import prisma from "../prisma/client";
const router = Router();

router.get("/:competitionId", async (req: Request, res: Response) => {
  const { competitionId } = req.params;
  try {
    const standings = await prisma.competition.findUnique({
      where: { id: competitionId },
      include: { standings: true },
    });
    res.json(standings);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/:competitionId/standings", async (req: Request, res: Response) => {
  const { competitionId } = req.params;

  try {
    const standings = await prisma.standings.findMany({
      where: { competitionId: competitionId },
      include: { team: true },
      orderBy: { position: "asc" },
    });
    res.json(standings);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/:competitionId/fixture", async (req: Request, res: Response) => {
  const { competitionId } = req.params;

  try {
    const fixture = await prisma.match.findMany({
      where: { competitionId: competitionId, status: "not_started" },
      include: {
        homeTeam: true,
        awayTeam: true,
        competition: true,
        stadium: true,
      },
      orderBy: { start_time: "asc" },
      take: 10,
    });
    res.json(fixture);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

export default router;
