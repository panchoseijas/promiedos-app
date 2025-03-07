/*
  Warnings:

  - You are about to drop the column `date` on the `Match` table. All the data in the column will be lost.
  - You are about to drop the column `location` on the `Match` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Player` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[competitionId,homeTeamId,awayTeamId,start_time]` on the table `Match` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `stadiumId` to the `Match` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_time` to the `Match` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Match_competitionId_homeTeamId_awayTeamId_date_key";

-- AlterTable
ALTER TABLE "Match" DROP COLUMN "date",
DROP COLUMN "location",
ADD COLUMN     "stadiumId" TEXT NOT NULL,
ADD COLUMN     "start_time" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Player" DROP COLUMN "createdAt",
ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "position" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Match_competitionId_homeTeamId_awayTeamId_start_time_key" ON "Match"("competitionId", "homeTeamId", "awayTeamId", "start_time");

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_stadiumId_fkey" FOREIGN KEY ("stadiumId") REFERENCES "Stadium"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
