/*
  Warnings:

  - A unique constraint covering the columns `[nome_login]` on the table `usuarios` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nome_login` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "usuarios" ADD COLUMN     "nome_login" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_nome_login_key" ON "usuarios"("nome_login");
