/*
  Warnings:

  - You are about to drop the column `base` on the `Jersey` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `Jersey` table. All the data in the column will be lost.
  - You are about to drop the column `sleeve` on the `Jersey` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Jersey" DROP COLUMN "base",
DROP COLUMN "number",
DROP COLUMN "sleeve",
ADD COLUMN     "baseColor" TEXT,
ADD COLUMN     "numberColor" TEXT,
ADD COLUMN     "sleeveColor" TEXT;
