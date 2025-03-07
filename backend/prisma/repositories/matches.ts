import prisma from "../client";

export async function getMatchesByDate(date: string, additionalOptions?: any) {
  const startDate = new Date(date);
  startDate.setHours(0, 0, 0, 0);
  const endDate = new Date(date);
  endDate.setHours(23, 59, 59, 999);

  const matches = await prisma.match.findMany({
    where: {
      start_time: {
        gte: startDate,
        lte: endDate,
      },
      ...additionalOptions,
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

  return matches.map((match) => {
    return {
      id: match.id,
      start_time: match.start_time,
      scoreHome: match.scoreHome,
      scoreAway: match.scoreAway,
      status: match.status,
      competition: {
        id: match.competition.id,
        name: match.competition.name,
        country: match.competition.country,
        logo: match.competition.logo,
      },
      homeTeam: {
        id: match.homeTeamId,
        name: match.homeTeam.name,
        logo: match.homeTeam.logo,
      },
      awayTeam: {
        id: match.awayTeamId,
        name: match.awayTeam.name,
        logo: match.awayTeam.logo,
      },
    };
  });
}

// export async function getMatchesByDateAndCompetitionId(
//   date: string,
//   competitionIds: string[]
// ) {
//   const startDate = new Date(date);
//   startDate.setHours(0, 0, 0, 0);
//   const endDate = new Date(date);
//   endDate.setHours(23, 59, 59, 999);

//   return await prisma.match.findMany({
//     where: {
//       start_time: {
//         gte: startDate,
//         lte: endDate,
//       },
//       competitionId: { in: competitionIds },
//     },
//     include: {
//       competition: true,
//       homeTeam: {
//         select: {
//           name: true,
//           logo: true,
//         },
//       },
//       awayTeam: {
//         select: {
//           name: true,
//           logo: true,
//         },
//       },
//     },
//     orderBy: {
//       start_time: "asc",
//     },
//   });
// }

// export async function getMatchesByDateAndTeamsId(
//   date: string,
//   teamIds: string[]
// ) {
//   const startDate = new Date(date);
//   startDate.setHours(0, 0, 0, 0);
//   const endDate = new Date(date);
//   endDate.setHours(23, 59, 59, 999);

//   return await prisma.match.findMany({
//     where: {
//       start_time: {
//         gte: startDate,
//         lte: endDate,
//       },
//       OR: [{ homeTeamId: { in: teamIds } }, { awayTeamId: { in: teamIds } }],
//     },
//     include: {
//       competition: true,
//       homeTeam: {
//         select: {
//           name: true,
//           logo: true,
//         },
//       },
//       awayTeam: {
//         select: {
//           name: true,
//           logo: true,
//         },
//       },
//     },
//     orderBy: {
//       start_time: "asc",
//     },
//   });
// }
