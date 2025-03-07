/*
  Warnings:

  - You are about to drop the `Standing` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Standing" DROP CONSTRAINT "Standing_competitionId_fkey";

-- DropForeignKey
ALTER TABLE "Standing" DROP CONSTRAINT "Standing_teamId_fkey";

-- DropTable
DROP TABLE "Standing";

-- CreateTable
CREATE TABLE "Standings" (
    "id" SERIAL NOT NULL,
    "competitionId" TEXT NOT NULL,
    "teamId" TEXT NOT NULL,
    "position" INTEGER NOT NULL,
    "played" INTEGER NOT NULL,
    "win" INTEGER NOT NULL,
    "loss" INTEGER NOT NULL,
    "draw" INTEGER NOT NULL,
    "goals_for" INTEGER NOT NULL,
    "goals_against" INTEGER NOT NULL,
    "goal_diff" INTEGER NOT NULL,
    "points" INTEGER NOT NULL,
    "form" TEXT NOT NULL,

    CONSTRAINT "Standings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Standings_competitionId_key" ON "Standings"("competitionId");

-- CreateIndex
CREATE UNIQUE INDEX "Standings_competitionId_teamId_key" ON "Standings"("competitionId", "teamId");

-- AddForeignKey
ALTER TABLE "Standings" ADD CONSTRAINT "Standings_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES "Competition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Standings" ADD CONSTRAINT "Standings_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
