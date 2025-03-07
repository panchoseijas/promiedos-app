import { View, Text } from "react-native";
import React from "react";
import { ThemedText } from "@/components/ThemedText";
import { ThemedView } from "@/components/ThemedView";
import { Image, TouchableOpacity } from "react-native";
import { countries } from "@/constants/Countries";
import BackButton from "@/components/BackButton";
import Container from "@/components/Container";
import { useLocalSearchParams, useRouter } from "expo-router";
import useMatch from "@/hooks/useMatch";
import { formatDate } from "@/lib/utils";
import CustomTabView from "@/components/CustomTabView";
import TableStandings from "@/pages/TableStandings";
import Head2Head from "@/pages/Head2Head";
import MatchInfo from "@/pages/MatchInfo";
import { ActivityIndicator } from "react-native";

const MatchDetails = () => {
  const { id } = useLocalSearchParams();
  const matchId = Array.isArray(id) ? id[0] : id;
  const { data: match, isLoading, error } = useMatch(matchId);
  const router = useRouter();

  if (isLoading) {
    return (
      <Container>
        <ActivityIndicator size="large" color="green" />
      </Container>
    );
  }
  if (!match) {
    return (
      <Container>
        <ThemedView className=" flex flex-row justify-between items-center mx-2">
          <BackButton />
        </ThemedView>
        <ThemedView className="flex flex-1 justify-center items-center">
          <ThemedText className="text-3xl font-bold">
            Match not found
          </ThemedText>
        </ThemedView>
      </Container>
    );
  }

  const matchStatusText = () => {
    switch (match.status) {
      case "not_started":
        return new Date(match.start_time)
          .toLocaleTimeString()
          .split(":")
          .slice(0, 2)
          .join(":");
      case "postponed":
        return "Postponed";
      case "abandoned":
        return "Abandoned";
      default:
        return `${match.scoreHome} - ${match.scoreAway}`;
    }
  };
  return (
    <Container>
      <ThemedView className=" flex flex-row justify-between items-center mx-2">
        <BackButton />
      </ThemedView>
      <ThemedView className="flex flex-row justify-evenly items-center p-2">
        <ThemedView className="w-4/12 flex justify-center flex-col items-center gap-y-2">
          <TouchableOpacity
            onPress={() => router.push(`/team/${match.homeTeam.id}`)}
          >
            <Image
              resizeMode="contain"
              source={{
                uri: match.homeTeam.logo || undefined,
              }}
              defaultSource={require("@/assets/images/logo-placeholder.png")}
              className="w-12 h-12"
            />
          </TouchableOpacity>

          {/* <ThemedText className="text-center font-semibold">
            {match.homeTeam.name}
          </ThemedText> */}
        </ThemedView>
        <ThemedView className="w-2/12 flex flex-col   justify-center items-center">
          {["not_started", "closed"].includes(match.status) ? (
            <ThemedText className=" m-auto font-semibold text-2xl">
              {match.status === "not_started"
                ? new Date(match.start_time)
                    .toLocaleTimeString()
                    .split(":")
                    .slice(0, 2)
                    .join(":")
                : `${match.scoreHome} - ${match.scoreAway}`}
            </ThemedText>
          ) : (
            <ThemedText className=" m-auto font-semibold text-xs">
              {matchStatusText()}
            </ThemedText>
          )}
        </ThemedView>
        <ThemedView className="w-4/12 flex justify-center flex-col items-center  gap-y-2">
          <TouchableOpacity
            onPress={() => router.push(`/team/${match.awayTeam.id}`)}
          >
            <Image
              resizeMode="contain"
              source={{
                uri: match.awayTeam.logo || undefined,
              }}
              defaultSource={require("@/assets/images/logo-placeholder.png")}
              className="w-12 h-12"
            />
          </TouchableOpacity>
          {/* <ThemedText className="text-center font-semibold">
            {match.awayTeam.name}
          </ThemedText> */}
        </ThemedView>
      </ThemedView>
      <ThemedView className="flex flex-row justify-evenly items-center">
        <ThemedView className="w-4/12">
          <ThemedText className="text-center font-semibold">
            {match.homeTeam.name}
          </ThemedText>
        </ThemedView>
        <ThemedView className="w-2/12">
          <ThemedText className="text-center font-semibold">
            {formatDate(new Date(match.start_time))}
          </ThemedText>
        </ThemedView>
        <ThemedView className="w-4/12">
          <ThemedText className="text-center font-semibold">
            {match.awayTeam.name}
          </ThemedText>
        </ThemedView>
      </ThemedView>
      <CustomTabView
        tabs={["Info", "Table", "H2H"]}
        pages={[
          () => <MatchInfo matchId={match.id} />,
          () => <TableStandings competitionId={match.competitionId} />,
          () => <Head2Head matchId={match.id} />,
        ]}
      />
    </Container>
  );
};

export default MatchDetails;
