import prisma from "../client";

export async function getCompetitionByName(name: string) {
  return await prisma.team.findFirst({
    where: { name },
    select: {
      id: true,
      name: true,
      logo: true,
    },
  });
}
