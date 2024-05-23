-- DropForeignKey
ALTER TABLE "acoes" DROP CONSTRAINT "acoes_fk_acessos_fkey";

-- AddForeignKey
ALTER TABLE "acoes" ADD CONSTRAINT "acoes_fk_acessos_fkey" FOREIGN KEY ("fk_acessos") REFERENCES "acessos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
