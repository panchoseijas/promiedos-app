import { fetchData } from "./fillDB";
import prisma from "./client";
import { connect } from "http2";

const updateMatches = async () => {
  try {
    const seasons = await prisma.competition.findMany({
      select: {
        id: true,
      },
    });

    const matches = await Promise.all(
      seasons.map(async ({ id }) => {
        const { schedules } = await fetchData(`/seasons/${id}/schedules`, {});

        const matches = schedules.map((match: any) => ({
          id: match.sport_event.id,
          competitionId: match.sport_event.sport_event_context.season.id,
          homeTeamId: match.sport_event.competitors[0].id,
          awayTeamId: match.sport_event.competitors[1].id,
          start_time: match.sport_event.start_time,
          round: match.sport_event.sport_event_context.round.number,
          scoreHome: match.sport_event_status.home_score,
          scoreAway: match.sport_event_status.away_score,
          status: match.sport_event_status.status,
          venue: match.sport_event.venue,
        }));

        await Promise.all(
          matches.map(async (match: any) => {
            const matchDB = await prisma.match.upsert({
              where: { id: match.id },
              update: {
                competitionId: match.competitionId,
                homeTeamId: match.homeTeamId,
                awayTeamId: match.awayTeamId,
                start_time: match.start_time,
                scoreHome: match.scoreHome,
                scoreAway: match.scoreAway,
                status: match.status,
              },
              create: {
                id: match.id,
                start_time: match.start_time,
                round: match.round,
                scoreHome: match.scoreHome,
                scoreAway: match.scoreAway,
                status: match.status,
                homeTeam: { connect: { id: match.homeTeamId } },
                awayTeam: { connect: { id: match.awayTeamId } },
                stadium: {
                  connect: {
                    id: match.venue ? match.venue.id : "sr:venue:1009",
                  },
                },
                competition: { connect: { id: match.competitionId } },
              },
            });
            return matchDB;
          })
        );
      })
    );

    console.log("Matches updated", matches);
  } catch (error) {
    console.log(error);
  }
};

updateMatches();
