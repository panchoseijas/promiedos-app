/*
  Warnings:

  - The primary key for the `Standing` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `drawn` on the `Standing` table. All the data in the column will be lost.
  - You are about to drop the column `lost` on the `Standing` table. All the data in the column will be lost.
  - You are about to drop the column `won` on the `Standing` table. All the data in the column will be lost.
  - The `id` column on the `Standing` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `draw` to the `Standing` table without a default value. This is not possible if the table is not empty.
  - Added the required column `loss` to the `Standing` table without a default value. This is not possible if the table is not empty.
  - Added the required column `win` to the `Standing` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Standing" DROP CONSTRAINT "Standing_pkey",
DROP COLUMN "drawn",
DROP COLUMN "lost",
DROP COLUMN "won",
ADD COLUMN     "draw" INTEGER NOT NULL,
ADD COLUMN     "loss" INTEGER NOT NULL,
ADD COLUMN     "win" INTEGER NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Standing_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Team" ADD COLUMN     "primaryColor" TEXT,
ADD COLUMN     "secondaryColor" TEXT;
