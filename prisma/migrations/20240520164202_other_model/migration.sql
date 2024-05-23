/*
  Warnings:

  - The primary key for the `grupos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `usuarios` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "_GrupoToUsuario" DROP CONSTRAINT "_GrupoToUsuario_A_fkey";

-- DropForeignKey
ALTER TABLE "_GrupoToUsuario" DROP CONSTRAINT "_GrupoToUsuario_B_fkey";

-- AlterTable
ALTER TABLE "_GrupoToUsuario" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "grupos" DROP CONSTRAINT "grupos_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "grupos_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "grupos_id_seq";

-- AlterTable
ALTER TABLE "usuarios" DROP CONSTRAINT "usuarios_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "usuarios_id_seq";

-- CreateTable
CREATE TABLE "acoes" (
    "id" TEXT NOT NULL,
    "fk_acessos" TEXT NOT NULL,
    "tipo_acesso" TEXT NOT NULL,
    "criar" BOOLEAN DEFAULT false,
    "editar" BOOLEAN DEFAULT false,
    "remover" BOOLEAN DEFAULT false,
    "emitir" BOOLEAN DEFAULT false,
    "emitirSegVia" BOOLEAN DEFAULT false,
    "cancelar" BOOLEAN DEFAULT false,
    "reativar" BOOLEAN DEFAULT false,
    "manutencao" BOOLEAN DEFAULT false,
    "estornar" BOOLEAN DEFAULT false,
    "homologar" BOOLEAN DEFAULT false,
    "consultar" BOOLEAN DEFAULT false,
    "transferir" BOOLEAN DEFAULT false,
    "executar" BOOLEAN DEFAULT false,

    CONSTRAINT "acoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "acessos" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "fk_usuario" TEXT,
    "fk_grupo" TEXT NOT NULL,
    "agencias" BOOLEAN DEFAULT false,
    "aliquotas_irrf" BOOLEAN DEFAULT false,
    "antecipacao_prorrogacao_vencimentos" BOOLEAN DEFAULT false,
    "arquivo_config" BOOLEAN DEFAULT false,
    "atos" BOOLEAN DEFAULT false,
    "bancos" BOOLEAN DEFAULT false,
    "baixa_automatica" BOOLEAN DEFAULT false,
    "baixa_manual" BOOLEAN DEFAULT false,
    "beneficiarios_fiscais" BOOLEAN DEFAULT false,
    "calculo" BOOLEAN DEFAULT false,
    "camaras_adicionais" BOOLEAN DEFAULT false,
    "cancelamento_reativacao_documentos" BOOLEAN DEFAULT false,
    "cadastro_geral" BOOLEAN DEFAULT false,
    "cadastros_gerais" BOOLEAN DEFAULT false,
    "campos_adicionais" BOOLEAN DEFAULT false,
    "cartorios" BOOLEAN DEFAULT false,
    "coberturas" BOOLEAN DEFAULT false,
    "competencias" BOOLEAN DEFAULT false,
    "condicoes_parcelamento" BOOLEAN DEFAULT false,
    "configuracao_boletos" BOOLEAN DEFAULT false,
    "configuracao_cancelamento_boletos" BOOLEAN DEFAULT false,
    "configuracao_guia_boletos" BOOLEAN DEFAULT false,
    "configuracao_inscricao_boletos" BOOLEAN DEFAULT false,
    "configuracao_pagamentos_boletos" BOOLEAN DEFAULT false,
    "configuracoes_economicas" BOOLEAN DEFAULT false,
    "configuracoes_imoveis" BOOLEAN DEFAULT false,
    "configuracoes_notas_avulsas" BOOLEAN DEFAULT false,
    "configuracoes_receitas_diversas" BOOLEAN DEFAULT false,
    "construtoras" BOOLEAN DEFAULT false,
    "contribuicoes_melhoria" BOOLEAN DEFAULT false,
    "contribuintes" BOOLEAN DEFAULT false,
    "controle_saldo_devedor" BOOLEAN DEFAULT false,
    "creditos_tributarios" BOOLEAN DEFAULT false,
    "declaracao_iss_homologado" BOOLEAN DEFAULT false,
    "desmembramentos" BOOLEAN DEFAULT false,
    "documentos" BOOLEAN DEFAULT false,
    "documentos_config" BOOLEAN DEFAULT false,
    "economicos" BOOLEAN DEFAULT false,
    "enderecos" BOOLEAN DEFAULT false,
    "englobados" BOOLEAN DEFAULT false,
    "engenheiros" BOOLEAN DEFAULT false,
    "estorno_inscricao" BOOLEAN DEFAULT false,
    "feriados" BOOLEAN DEFAULT false,
    "fontes_divulgacao" BOOLEAN DEFAULT false,
    "formulas" BOOLEAN DEFAULT false,
    "geoprocessamento" BOOLEAN DEFAULT false,
    "geoprocessamento_config" BOOLEAN DEFAULT false,
    "gerenciador_economico" BOOLEAN DEFAULT false,
    "guias" BOOLEAN DEFAULT false,
    "horarios_funcionamento" BOOLEAN DEFAULT false,
    "imoveis" BOOLEAN DEFAULT false,
    "imoveis_config" BOOLEAN DEFAULT false,
    "imobiliarias" BOOLEAN DEFAULT false,
    "indexadores" BOOLEAN DEFAULT false,
    "inscricao_divida" BOOLEAN DEFAULT false,
    "integracao_contabil" BOOLEAN DEFAULT false,
    "integracao_lancamentos_config" BOOLEAN DEFAULT false,
    "integracoes_contabeis_config" BOOLEAN DEFAULT false,
    "junta_comercial_config" BOOLEAN DEFAULT false,
    "livros_divida_ativa" BOOLEAN DEFAULT false,
    "limites_arrecadacao" BOOLEAN DEFAULT false,
    "manutencao_divida" BOOLEAN DEFAULT false,
    "manutencao_pagamentos" BOOLEAN DEFAULT false,
    "materiais_servicos" BOOLEAN DEFAULT false,
    "motivos" BOOLEAN DEFAULT false,
    "naturezas_texto_juridico" BOOLEAN DEFAULT false,
    "notas_avulsas" BOOLEAN DEFAULT false,
    "notas_avulsas_config" BOOLEAN DEFAULT false,
    "obras" BOOLEAN DEFAULT false,
    "obras_config" BOOLEAN DEFAULT false,
    "parcelas" BOOLEAN DEFAULT false,
    "parcelamento_credito" BOOLEAN DEFAULT false,
    "planta_valores" BOOLEAN DEFAULT false,
    "receitas_diversas" BOOLEAN DEFAULT false,
    "receitas_diversas_config" BOOLEAN DEFAULT false,
    "requerimento_manutencao_lancamento" BOOLEAN DEFAULT false,
    "tabelas_calculo" BOOLEAN DEFAULT false,
    "taxas_expediente_config" BOOLEAN DEFAULT false,
    "termos_abertura_encerramento_livro" BOOLEAN DEFAULT false,
    "tipos_documentos" BOOLEAN DEFAULT false,
    "transferencia_imoveis" BOOLEAN DEFAULT false,
    "transferencia_imoveis_config" BOOLEAN DEFAULT false,
    "unidades_medida" BOOLEAN DEFAULT false,
    "viabilidade" BOOLEAN DEFAULT false,

    CONSTRAINT "acessos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "acessos_fk_usuario_key" ON "acessos"("fk_usuario");

-- AddForeignKey
ALTER TABLE "acoes" ADD CONSTRAINT "acoes_fk_acessos_fkey" FOREIGN KEY ("fk_acessos") REFERENCES "acessos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acessos" ADD CONSTRAINT "acessos_fk_usuario_fkey" FOREIGN KEY ("fk_usuario") REFERENCES "usuarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "acessos" ADD CONSTRAINT "acessos_fk_grupo_fkey" FOREIGN KEY ("fk_grupo") REFERENCES "grupos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GrupoToUsuario" ADD CONSTRAINT "_GrupoToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "grupos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GrupoToUsuario" ADD CONSTRAINT "_GrupoToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;
