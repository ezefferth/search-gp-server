import { Request, Response } from 'express';
import { Prisma } from '@prisma/client';
import { prismaClient } from '../../data/prismaClient';

export class AtualizarAcessos {
  async handle(request: Request, response: Response) {
    const { id, ...data } = request.body;

    try {
      // Atualiza o acesso com os dados fornecidos
      const acessos = await prismaClient.acessos.update({
        where: { id },
        data: data,
        include: { acoes: true }
      });

      // Array para armazenar as novas ações criadas/excluídas
      const novasAcoes = [];

      // Processa cada tipo de acesso e valor
      for (const [tipoAcesso, valor] of Object.entries(data)) {
        const verificaExisteAcao = await prismaClient.acoes.findMany({
          where: {
            tipo_acesso: tipoAcesso,
            fk_acessos: id
          }
        });

        if (valor === true && verificaExisteAcao.length === 0) {
          // Cria um novo registro de Acoes com o tipo de acesso correspondente
          const novaAcao = await prismaClient.acoes.create({
            data: {
              acesso: { connect: { id: acessos.id } }, // Conecta o novo registro de Acoes ao acesso correspondente
              tipo_acesso: tipoAcesso
            }
          });
          novasAcoes.push(novaAcao);
        } else if (valor === false && verificaExisteAcao.length > 0) {
          // Exclui o registro de Acoes existente
          const acaoRemovida = await prismaClient.acoes.delete({
            where: { id: verificaExisteAcao[0].id }
          });
          novasAcoes.push(acaoRemovida);
        }
      }

      return response.status(200).json({ acessos, novasAcoes });
    } catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json({ error: e.code });
      }
      // Log any unexpected errors and return a server error response
      console.error(e);
      return response.status(500).json({ error: 'Internal server error' });
    }
  }
}
