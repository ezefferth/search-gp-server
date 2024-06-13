/*
  Warnings:

  - Added the required column `fk_secretaria` to the `setores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cargo` to the `usuarios` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vinculo` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "setores" ADD COLUMN     "fk_secretaria" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "usuarios" ADD COLUMN     "cargo" TEXT NOT NULL,
ADD COLUMN     "vinculo" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "secretaria" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "secretaria_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "secretaria_nome_key" ON "secretaria"("nome");

-- AddForeignKey
ALTER TABLE "setores" ADD CONSTRAINT "setores_fk_secretaria_fkey" FOREIGN KEY ("fk_secretaria") REFERENCES "secretaria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
