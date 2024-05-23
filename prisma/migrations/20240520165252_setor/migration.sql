/*
  Warnings:

  - A unique constraint covering the columns `[fk_setor]` on the table `usuarios` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `fk_setor` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "acoes" ALTER COLUMN "tipo_acesso" DROP NOT NULL;

-- AlterTable
ALTER TABLE "usuarios" ADD COLUMN     "fk_setor" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Setor" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "Setor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Setor_nome_key" ON "Setor"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_fk_setor_key" ON "usuarios"("fk_setor");

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_fk_setor_fkey" FOREIGN KEY ("fk_setor") REFERENCES "Setor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
