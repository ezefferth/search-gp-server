/*
  Warnings:

  - You are about to drop the `Setor` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "usuarios" DROP CONSTRAINT "usuarios_fk_setor_fkey";

-- DropIndex
DROP INDEX "usuarios_fk_setor_key";

-- DropTable
DROP TABLE "Setor";

-- CreateTable
CREATE TABLE "setores" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "setores_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "setores_nome_key" ON "setores"("nome");

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_fk_setor_fkey" FOREIGN KEY ("fk_setor") REFERENCES "setores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
