/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Competition` table. All the data in the column will be lost.
  - You are about to drop the column `seasonId` on the `Competition` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Stadium` table. All the data in the column will be lost.
  - You are about to drop the column `seasonId` on the `Standing` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `TeamFollow` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `TeamPlayer` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[competitionId]` on the table `Standing` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[competitionId,teamId]` on the table `Standing` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `competitionId` to the `Standing` table without a default value. This is not possible if the table is not empty.
  - Added the required column `goal_diff` to the `Standing` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shortName` to the `Team` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Standing" DROP CONSTRAINT "Standing_seasonId_fkey";

-- DropIndex
DROP INDEX "Competition_seasonId_key";

-- DropIndex
DROP INDEX "Standing_seasonId_key";

-- DropIndex
DROP INDEX "Standing_seasonId_teamId_key";

-- AlterTable
ALTER TABLE "Competition" DROP COLUMN "createdAt",
DROP COLUMN "seasonId",
ADD COLUMN     "logo" TEXT;

-- AlterTable
ALTER TABLE "Stadium" DROP COLUMN "createdAt";

-- AlterTable
ALTER TABLE "Standing" DROP COLUMN "seasonId",
ADD COLUMN     "competitionId" TEXT NOT NULL,
ADD COLUMN     "goal_diff" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Team" ADD COLUMN     "shortName" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "TeamFollow" DROP COLUMN "createdAt";

-- AlterTable
ALTER TABLE "TeamPlayer" DROP COLUMN "createdAt";

-- CreateTable
CREATE TABLE "Match" (
    "id" TEXT NOT NULL,
    "competitionId" TEXT NOT NULL,
    "homeTeamId" TEXT NOT NULL,
    "awayTeamId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "location" TEXT NOT NULL,
    "scoreHome" INTEGER,
    "scoreAway" INTEGER,
    "status" TEXT NOT NULL,
    "round" INTEGER NOT NULL,

    CONSTRAINT "Match_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CompetitionToTeam" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Match_competitionId_homeTeamId_awayTeamId_date_key" ON "Match"("competitionId", "homeTeamId", "awayTeamId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "_CompetitionToTeam_AB_unique" ON "_CompetitionToTeam"("A", "B");

-- CreateIndex
CREATE INDEX "_CompetitionToTeam_B_index" ON "_CompetitionToTeam"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Standing_competitionId_key" ON "Standing"("competitionId");

-- CreateIndex
CREATE UNIQUE INDEX "Standing_competitionId_teamId_key" ON "Standing"("competitionId", "teamId");

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_homeTeamId_fkey" FOREIGN KEY ("homeTeamId") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_awayTeamId_fkey" FOREIGN KEY ("awayTeamId") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES "Competition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Standing" ADD CONSTRAINT "Standing_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES "Competition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetitionToTeam" ADD CONSTRAINT "_CompetitionToTeam_A_fkey" FOREIGN KEY ("A") REFERENCES "Competition"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetitionToTeam" ADD CONSTRAINT "_CompetitionToTeam_B_fkey" FOREIGN KEY ("B") REFERENCES "Team"("id") ON DELETE CASCADE ON UPDATE CASCADE;
