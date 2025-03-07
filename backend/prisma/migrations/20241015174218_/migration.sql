/*
  Warnings:

  - A unique constraint covering the columns `[id,teamId]` on the table `Player` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Player_name_teamId_key";

-- CreateIndex
CREATE UNIQUE INDEX "Player_id_teamId_key" ON "Player"("id", "teamId");
