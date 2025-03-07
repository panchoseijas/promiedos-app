/*
  Warnings:

  - A unique constraint covering the columns `[teamId,type]` on the table `Jersey` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Jersey_teamId_key";

-- CreateIndex
CREATE UNIQUE INDEX "Jersey_teamId_type_key" ON "Jersey"("teamId", "type");
