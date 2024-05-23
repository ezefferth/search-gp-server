-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grupos" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "grupos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GrupoToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_nome_key" ON "usuarios"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "grupos_nome_key" ON "grupos"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "_GrupoToUsuario_AB_unique" ON "_GrupoToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_GrupoToUsuario_B_index" ON "_GrupoToUsuario"("B");

-- AddForeignKey
ALTER TABLE "_GrupoToUsuario" ADD CONSTRAINT "_GrupoToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "grupos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GrupoToUsuario" ADD CONSTRAINT "_GrupoToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;
