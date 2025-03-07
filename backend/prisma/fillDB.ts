import prisma from "./client";
import dotenv from "dotenv";
import fs from "fs";
import {
  createSingleTeam,
  createPlayersFromTeam,
  createSingleMatch,
  createStadiumsFromMatches,
  createJerseysFromTeam,
} from "./createRecords";

dotenv.config();

const competitionsId = [
  "sr:competition:155", // Liga Profesional
  "sr:competition:17", // PL
  "sr:competition:8", //La Liga
  "sr:competition:37", // Eredivise
  "sr:competition:35", //Bundesliga
  "sr:competition:34", // Ligue 1
  "sr:competition:238", // Primeira Liga
  "sr:competition:18", // Championship

  // "sr:competition:325", // Brasileirao
  // "sr:competition:23", //Serie A
];

const API_KEY = process.env.SPORTSRADAR_API_KEY;

export const fetchData = async (endpoint: String, params: any) => {
  const options = {
    method: "GET",
    headers: { accept: "application/json" },
  };
  try {
    const response = await fetch(
      `https://api.sportradar.com/soccer/trial/v4/en${endpoint}.json?api_key=${API_KEY}`,
      options
    );
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    return await response.json();
  } catch (err) {
    console.error(err);
  }
};

const fetchCompetition = async (competitionId: String) => {
  try {
    const { competition } = await fetchData(
      `/competitions/${competitionId}/info`,
      {}
    );

    const { seasons } = await fetchData(
      `/competitions/${competitionId}/seasons`,
      {}
    );
    const season = seasons[seasons.length - 1];

    const standingsResponse = await fetchData(
      `/seasons/${seasons[seasons.length - 1].id}/standings`,
      {}
    );
    const { groups } = standingsResponse.standings[0];
    const { standings: standingsData } = groups[0];

    const standings = standingsData.map((table: any) => ({
      competitionId: season.id,
      teamId: table.competitor.id,
      position: table.rank,
      played: table.played,
      win: table.win,
      loss: table.loss,
      draw: table.draw,
      goals_for: table.goals_for,
      goals_against: table.goals_against,
      points: table.points,
      form: table.competitor.form,
    }));

    const promises = standingsData.map(
      async ({ competitor }: { competitor: any }) => {
        const teamResponse = await fetchData(
          `/competitors/${competitor.id}/profile`,
          {}
        );
        return teamResponse;
      }
    );

    const teamsData = await Promise.all(promises);

    const teams = teamsData.map((team: any) => ({
      id: team.competitor.id,
      name: team.competitor.name,
      shortName: team.competitor.abbreviation,
      city: team.venue.city_name,
      country: team.competitor.country_code,
      managerName: team.manager.name,
      stadiumId: team.venue.id,
      primaryColor: team.jerseys[0].base,
      secondaryColor: team.jerseys[1].base,
      stadium: team.venue,
      players: team.players.map((player: any) => ({
        id: player.id,
        name: player.name,
        teamId: team.competitor.id,
        position: player.type,
        number: player.jersey_number,
        country: player.country_code,
      })),
      jerseys: team.jerseys,
    }));

    const { schedules } = await fetchData(
      `/seasons/${season.id}/schedules`,
      {}
    );

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

    return {
      competition,
      season,
      standings,
      teams,
      matches,
    };
  } catch (error) {
    console.log("Error fetching data:", error);
  }
};

const dataBasePromises = async ({
  competition,
  season,
  standings,
  teams,
  matches,
}: {
  competition: any;
  season: any;
  standings: any;
  teams: any;
  matches: any;
}) => {
  try {
    const dbCompetition = await prisma.competition.create({
      data: {
        id: season.id,
        name: competition.name,
        country: competition.category.country_code,
      },
    });
    const teamsPromisies = teams.map(async (team: any) => {
      await createSingleTeam(team, season.id);
    });
    const dbTeams = await Promise.all(teamsPromisies);

    const dbStandings = await prisma.standings.createManyAndReturn({
      data: standings.map((table: any) => {
        return {
          ...table,
        };
      }),
    });

    const dbStadiums = await createStadiumsFromMatches(matches);

    const matchesPromises = matches.map(async (match: any) => {
      await createSingleMatch(match);
    });
    const dbMatches = await Promise.all(matchesPromises);

    const playersPromises = teams.map(async (team: any) => {
      await createPlayersFromTeam(team.players);
    });
    const dbPlayers = await Promise.all(playersPromises);

    const jerseyPromises = teams.map(async (team: any) => {
      await createJerseysFromTeam(team);
    });

    const dbJerseys = await Promise.all(jerseyPromises);

    return {
      dbCompetition,
      dbTeams,
      dbStandings,
      dbStadiums,
      dbMatches,
      dbPlayers,
    };
  } catch (error) {
    console.error(`Error filling database ${competition.id}:`, error);
  }
};

const deleteAll = async () => {
  await prisma.match.deleteMany();
  await prisma.jersey.deleteMany();
  await prisma.standings.deleteMany();
  await prisma.competition.deleteMany();
  await prisma.player.deleteMany();
  await prisma.team.deleteMany();
  await prisma.stadium.deleteMany();
};

const fillDatabase = async () => {
  const data = competitionsId.map((competitionId) =>
    fetchCompetition(competitionId)
  );
  const response = await Promise.all(data);

  const jsonString = JSON.stringify(response, null, 2);
  fs.writeFileSync("./prisma/response.json", jsonString, "utf-8");
  console.log("Data fetched and saved to response.json");

  await deleteAll();
  const db = response.map(async (data: any) => {
    dataBasePromises(data);
  });
  await Promise.all(db);

  console.log("Database filled");
};

//fillDatabase();
