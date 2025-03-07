import { Router, Request, Response } from "express";
import prisma from "../prisma/client";
import { fetchData } from "../prisma/fillDB";
const router = Router();

router.get("/:teamId", async (req: Request, res: Response) => {
  const { teamId } = req.params;
  try {
    const team = await prisma.team.findUnique({
      where: { id: teamId },
    });
    res.json(team);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/:teamId/summary", async (req: Request, res: Response) => {
  const { teamId } = req.params;
  try {
    const teamInfo = await prisma.team.findUnique({
      where: { id: teamId },
      include: { stadium: true, jerseys: true },
    });

    if (!teamInfo) {
      res.status(404).json({ error: "Team not found" });
      return;
    }
    const { jerseys, ...team } = teamInfo;

    const nextMatch = await prisma.match.findMany({
      where: {
        OR: [{ homeTeamId: teamId }, { awayTeamId: teamId }],
        status: "not_started",
      },
      include: {
        homeTeam: {
          select: { logo: true, name: true },
        },
        awayTeam: { select: { logo: true, name: true } },
        competition: { select: { name: true } },
      },
      orderBy: {
        start_time: "asc",
      },
      take: 1,
    });

    const last5matches = await prisma.match.findMany({
      where: {
        OR: [{ homeTeamId: teamId }, { awayTeamId: teamId }],
        status: "closed",
      },
      include: {
        homeTeam: {
          select: { logo: true, name: true },
        },
        awayTeam: { select: { logo: true, name: true } },
      },
      orderBy: {
        start_time: "desc",
      },
      take: 5,
    });

    const response = {
      team: {
        ...team,
        primary_color: jerseys.filter((jersey) => jersey.type === "home")[0]
          .baseColor,
        secondary_color: jerseys.filter((jersey) => jersey.type === "away")[0]
          .baseColor,
        number_color: jerseys.filter((jersey) => jersey.type === "home")[0]
          .numberColor,
      },
      next_match: nextMatch[0],
      last_5_matches: last5matches,
    };

    res.json(response);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/:teamId/form", async (req: Request, res: Response) => {
  const { teamId } = req.params;
  const { skip } = req.query;
  try {
    const matches = await prisma.match.findMany({
      skip: skip ? parseInt(skip as string) : 0,
      where: {
        OR: [{ homeTeamId: teamId }, { awayTeamId: teamId }],
        status: "closed",
      },
      include: {
        homeTeam: {
          select: { logo: true, name: true },
        },
        awayTeam: { select: { logo: true, name: true } },
      },
      orderBy: {
        start_time: "desc",
      },
      take: 5,
    });
    res.json(matches);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/:teamId/players", async (req: Request, res: Response) => {
  const { teamId } = req.params;
  try {
    const players = await prisma.player.findMany({
      where: { teamId },
    });

    const jerseys = await prisma.jersey.findMany({
      where: { teamId },
    });

    const groupedPlayers = players.reduce((acc, player) => {
      const key = player.position || "unknown";
      if (!acc[key]) {
        acc[key] = [];
      }
      acc[key].push(player);
      return acc;
    }, {} as { [key: string]: typeof players });
    console.log(groupedPlayers);

    const manager = await prisma.team.findUnique({
      where: { id: teamId },
      select: { managerName: true },
    });

    res.json({
      players: groupedPlayers,
      jerseys,
      manager: manager?.managerName,
    });
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

export default router;
