/*
  Warnings:

  - You are about to drop the column `primaryColor` on the `Jersey` table. All the data in the column will be lost.
  - You are about to drop the column `secondaryColor` on the `Jersey` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Jersey" DROP COLUMN "primaryColor",
DROP COLUMN "secondaryColor",
ADD COLUMN     "base" TEXT,
ADD COLUMN     "number" TEXT,
ADD COLUMN     "sleeve" TEXT;
