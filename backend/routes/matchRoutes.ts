import { Router, Request, Response } from "express";
import prisma from "../prisma/client";
import { fetchData } from "../prisma/fillDB";
import { getTeamsById } from "../prisma/repositories/teams";
import { getCompetitionByName } from "../prisma/repositories/competition";
const router = Router();

router.get("/:matchId", async (req: Request, res: Response) => {
  const { matchId } = req.params;
  try {
    const match = await prisma.match.findUnique({
      where: { id: matchId },
      include: {
        homeTeam: true,
        awayTeam: true,
        stadium: true,
        competition: true,
      },
    });
    res.json(match);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/:matchId/h2h", async (req: Request, res: Response) => {
  const { matchId } = req.params;
  try {
    const teamsIds = await prisma.match.findUnique({
      where: { id: matchId },
      select: {
        homeTeamId: true,
        awayTeamId: true,
      },
    });

    if (!teamsIds) {
      res.status(404).json({ error: "Match not found" });
      return;
    }

    const { homeTeamId, awayTeamId } = teamsIds;

    const teams = await prisma.team.findMany({
      where: {
        OR: [{ id: homeTeamId }, { id: awayTeamId }],
      },
      include: {
        jerseys: true,
      },
    });

    const [homeTeam, awayTeam] = teams.map(({ jerseys, ...team }) => ({
      ...team,
      primary_color: jerseys.filter((jersey) => jersey.type === "home")[0]
        .baseColor,
      secondary_color: jerseys.filter((jersey) => jersey.type === "away")[0]
        .baseColor,
      number_color: jerseys.filter((jersey) => jersey.type === "home")[0]
        .numberColor,
    }));

    const data = await fetchData(
      `/competitors/${homeTeamId}/versus/${awayTeamId}/summaries`,
      {}
    );

    if (!data) {
      res.status(403).json({ error: "Actualizar Sportsradar APIKEY" });
      return;
    }

    const h2h = {
      homeTeam,
      awayTeam,
      lastMatches: await Promise.all(
        data.last_meetings.map(async (match: any) => ({
          id: match.sport_event.id,
          start_time: match.sport_event.start_time,
          scoreHome: match.sport_event_status.period_scores[1].home_score,
          scoreAway: match.sport_event_status.period_scores[1].away_score,
          status: match.sport_event_status.status,
          competition: {
            id: match.sport_event.sport_event_context.competition.id,
            name: match.sport_event.sport_event_context.competition.name,
            logo: "",
          },
          homeTeam: await getTeamsById(match.sport_event.competitors[0].id),
          awayTeam: await getTeamsById(match.sport_event.competitors[1].id),
        }))
      ),
    };
    // {
    //     id: match.id,
    //     start_time: match.start_time,
    //     scoreHome: match.scoreHome,
    //     scoreAway: match.scoreAway,
    //     status: match.status,
    //     competition: {
    //       id: match.competition.id,
    //       name: match.competition.name,
    //       country: match.competition.country,
    //       logo: match.competition.logo,
    //     },
    //     homeTeam: {
    //       id: match.homeTeamId,
    //       name: match.homeTeam.name,
    //       logo: match.homeTeam.logo,
    //     },
    //     awayTeam: {
    //       id: match.awayTeamId,
    //       name: match.awayTeam.name,
    //       logo: match.awayTeam.logo,
    //     },
    //   };

    res.json(h2h);
  } catch (e: any) {
    console.error(e);
    // if (e.response.status === 403) {
    //   res.json({ error: "Actualizar Sportsradar APIKEY" });
    // } else {
    //   res.json({ error: e.message });
    // }
    res.json({ error: e.message });
  }
});

router.get("/:matchId/info", async (req: Request, res: Response) => {
  const { matchId } = req.params;
  try {
    const match = await prisma.match.findUnique({
      where: { id: matchId },
      include: {
        competition: true,
        stadium: true,
      },
    });
    res.json(match);
  } catch (e: any) {
    console.error(e);
    res.json({ error: e.message });
  }
});

router.get("/teams/:teamIds", async (req: Request, res: Response) => {
  const { date } = req.query;
  const { teamIds } = req.params;
  let teamIdsArray: string[] = [];
  try {
    teamIdsArray = JSON.parse(teamIds).map((team: { id: string }) => team.id);
  } catch (error) {
    res.status(400).json({ message: "Invalid teamIds format." });
    return;
  }

  try {
    const startDate = new Date(date as string);
    startDate.setHours(0, 0, 0, 0);
    const endDate = new Date(date as string);
    endDate.setHours(23, 59, 59, 999);

    const matchesByCompetition = await prisma.match.findMany({
      where: {
        start_time: {
          gte: startDate,
          lte: endDate,
        },
        OR: [
          { homeTeamId: { in: teamIdsArray } },
          { awayTeamId: { in: teamIdsArray } },
        ],
      },
      include: {
        competition: true,
        homeTeam: {
          select: {
            name: true,
            logo: true,
          },
        },
        awayTeam: {
          select: {
            name: true,
            logo: true,
          },
        },
      },
      orderBy: {
        start_time: "asc",
      },
    });

    res.json(matchesByCompetition);
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ message: "An error occurred while fetching matches." });
  }
});
export default router;
