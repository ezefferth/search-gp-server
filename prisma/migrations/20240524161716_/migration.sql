/*
  Warnings:

  - Added the required column `updatedAt` to the `acoes` table without a default value. This is not possible if the table is not empty.
  - Made the column `tipo_acesso` on table `acoes` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `updatedAt` to the `setores` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "acoes" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "tipo_acesso" SET NOT NULL;

-- AlterTable
ALTER TABLE "setores" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;
