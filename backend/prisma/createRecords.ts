import { connect } from "http2";
import prisma from "./client";

export const createSingleTeam = async (team: any, competitionId: any) => {
  const teamExists = await prisma.team.findUnique({
    where: { id: team.id },
  });
  if (teamExists) {
    console.error(`Team ${team.id} already exists`);
    return;
  }
  try {
    const dbTeam = await prisma.team.create({
      data: {
        id: team.id,
        name: team.name,
        shortName: team.shortName,
        city: team.city,
        country: team.country,
        managerName: team.managerName,
        stadium: {
          connectOrCreate: {
            where: { id: team.stadiumId },
            create: {
              id: team.stadium.id,
              name: team.stadium.name,
              city: team.stadium.city_name,
              country: team.stadium.country_name,
              capacity: team.stadium.capacity,
            },
          },
        },
        competitions: {
          connect: {
            id: competitionId,
          },
        },
      },
    });

    return { dbTeam };
  } catch (error) {
    console.error(`Failed to create team ${team.id}`, "ERROR");
    // console.log("team info:", team.id, team.name);
  }
};

export const createPlayersFromTeam = async (players: any) => {
  const dbPlayers = await prisma.player.createMany({
    data: players.map((player: any) => ({
      ...player,
    })),
    skipDuplicates: true,
  });
};

export const createSingleMatch = async ({
  id,
  competitionId,
  homeTeamId,
  awayTeamId,
  start_time,
  round,
  scoreHome,
  scoreAway,
  status,
  venue,
}: {
  id: any;
  competitionId: any;
  homeTeamId: any;
  awayTeamId: any;
  start_time: any;
  round: any;
  scoreHome: any;
  scoreAway: any;
  status: any;
  venue: any;
}) => {
  return await prisma.match.create({
    data: {
      id,
      start_time,
      round,
      scoreHome,
      scoreAway,
      status,
      homeTeam: {
        connect: { id: homeTeamId },
      },
      awayTeam: {
        connect: { id: awayTeamId },
      },
      competition: {
        connect: { id: competitionId },
      },
      stadium: {
        connect: { id: venue.id },
      },
    },
  });
};

export const createStadiumsFromMatches = async (matches: any) => {
  const stadiums = matches.map((match: any) => ({
    id: match.venue.id,
    name: match.venue.name,
    city: match.venue.city_name,
    country: match.venue.country_name,
    capacity: match.venue.capacity,
  }));
  const uniqueStadiums = Array.from(
    new Set(stadiums.map((a: any) => a.id))
  ).map((id: any) => {
    return stadiums.find((a: any) => a.id === id);
  });
  const stadiumPromises = uniqueStadiums.map(async (stadium: any) => {
    try {
      await prisma.stadium.upsert({
        where: { id: stadium.id },
        update: {
          name: stadium.name,
          city: stadium.city,
          country: stadium.country,
          capacity: stadium.capacity,
        },
        create: {
          id: stadium.id,
          name: stadium.name,
          city: stadium.city,
          country: stadium.country,
          capacity: stadium.capacity,
        },
      });
    } catch (error) {
      console.error(`Failed to create stadium ${stadium.name}:`, error);
    }
  });
  await Promise.all(stadiumPromises);
};

export const createJerseysFromTeam = async (team: any) => {
  const jerseysPromises = team.jerseys.map(async (jersey: any) => {
    try {
      const dbJersey = await prisma.jersey.create({
        data: {
          id: jersey.id,
          type: jersey.type,
          baseColor: jersey.base,
          sleeveColor: jersey.sleeve,
          numberColor: jersey.number,
          team: {
            connect: {
              id: team.id,
            },
          },
        },
      });
      return { dbJersey };
    } catch (error) {
      console.error(`Failed to create jersey for ${team.id}:`, error);
    }
  });
  await Promise.all(jerseysPromises);
};
