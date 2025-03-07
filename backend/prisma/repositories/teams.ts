import prisma from "../client";

export async function getTeamsById(id: string) {
  return await prisma.team.findUnique({
    where: { id },
    select: {
      id: true,
      name: true,
      logo: true,
    },
  });
}
