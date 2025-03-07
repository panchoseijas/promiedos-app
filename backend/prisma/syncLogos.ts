import prisma from "./client";

export const fetchData = async (endpoint: String, params: any) => {
  const options = {
    method: "GET",
    headers: {
      accept: "application/json",
      "X-Auth-Token": process.env.FOOTBALL_API_KEY!,
    },
  };
  try {
    const response = await fetch(
      `https://api.football-data.org/v4/${endpoint}`,
      options
    );
    if (!response.ok) {
      console.log(response);
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    return await response.json();
  } catch (err) {
    console.error(err);
  }
};

const updateTeamLogos = async (logos: Record<string, string>) => {
  for (const [SN, logoUrl] of Object.entries(logos)) {
    try {
      const dbTeam = await prisma.team.findFirst({
        where: { shortName: SN },
      });

      if (!dbTeam) {
        console.log(
          `Equipo con abreviación ${SN} no encontrado en la base de datos.`
        );
        continue;
      }

      await prisma.team.update({
        where: { id: dbTeam.id },
        data: { logo: logoUrl },
      });

      console.log(`Logo actualizado para el equipo: ${SN}`);
    } catch (error) {
      console.error(`Error actualizando logo para ${SN}:`, error);
    }
  }
};

const fetchLogosDictionary = async (): Promise<Record<string, string>> => {
  try {
    const code = "PPL";
    const teamsData = await fetchData(`/competitions/${code}/teams`, {});
    // console.log("Datos de equipos obtenidos de la API:", teamsData);
    const logosDictionary: Record<string, string> = {};

    teamsData.teams.forEach((team: any) => {
      if (team.tla && team.crest) {
        logosDictionary[team.tla] = team.crest;
      }
    });

    return logosDictionary;
    return {};
  } catch (error) {
    console.error("Error fetching logos dictionary:", error);
    return {};
  }
};

const syncTeamLogos = async () => {
  try {
    const logosDictionary = await fetchLogosDictionary();
    console.log("Logos obtenidos de la API:", logosDictionary);

    await updateTeamLogos(logosDictionary);
    console.log("Todos los logos han sido actualizados.");
  } catch (error) {
    console.error("Error sincronizando los logos:", error);
  }
};

syncTeamLogos();
