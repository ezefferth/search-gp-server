/*
  Warnings:

  - A unique constraint covering the columns `[fk_grupo]` on the table `acessos` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "acessos" DROP CONSTRAINT "acessos_fk_grupo_fkey";

-- DropForeignKey
ALTER TABLE "acessos" DROP CONSTRAINT "acessos_fk_usuario_fkey";

-- AlterTable
ALTER TABLE "acessos" ALTER COLUMN "fk_grupo" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "acessos_fk_grupo_key" ON "acessos"("fk_grupo");

-- AddForeignKey
ALTER TABLE "acessos" ADD CONSTRAINT "acessos_fk_usuario_fkey" FOREIGN KEY ("fk_usuario") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acessos" ADD CONSTRAINT "acessos_fk_grupo_fkey" FOREIGN KEY ("fk_grupo") REFERENCES "grupos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
