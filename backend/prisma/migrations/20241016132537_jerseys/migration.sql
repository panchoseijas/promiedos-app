/*
  Warnings:

  - You are about to drop the column `primaryColor` on the `Team` table. All the data in the column will be lost.
  - You are about to drop the column `secondaryColor` on the `Team` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Team" DROP COLUMN "primaryColor",
DROP COLUMN "secondaryColor";

-- CreateTable
CREATE TABLE "Jersey" (
    "id" SERIAL NOT NULL,
    "teamId" TEXT NOT NULL,
    "type" TEXT,
    "primaryColor" TEXT,
    "secondaryColor" TEXT,

    CONSTRAINT "Jersey_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Jersey_teamId_key" ON "Jersey"("teamId");

-- AddForeignKey
ALTER TABLE "Jersey" ADD CONSTRAINT "Jersey_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
