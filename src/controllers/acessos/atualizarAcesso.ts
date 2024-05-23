
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'


export class AtualizarAcessos {
  async handle(request: Request, response: Response) {
    const { id, ...data } = request.body
    try {
      const acessos = await prismaClient.acessos.update({
        where: {
          id: id
        },
        data: data,
        include: {
          acoes: true
        }
      })
      const acoes = await Promise.all(Object.entries(data).map(async ([tipoAcesso, valor]) => {
        const verificaExisteAcao = await prismaClient.acoes.findMany({
          where: {
            tipo_acesso: {
              equals: tipoAcesso
            }
          }
        })
        if (valor === true && verificaExisteAcao.length === 0) {
          // Cria um novo registro de Acoes com o tipo de acesso correspondente
          return await prismaClient.acoes.create({
            data: {
              acesso: { connect: { id: acessos.id } }, // Conecta o novo registro de Acoes ao acesso correspondente
              tipo_acesso: tipoAcesso
              // Outros campos de Acoes, se houver
            }
          })
        }
        else if (valor === false && verificaExisteAcao.length > 0) {
          return await prismaClient.acoes.delete({
            where: {
              id: verificaExisteAcao[0].id
            }
          })
        }
      }))


      return response.status(200).json({ acessos: acessos, novasAcoes: acoes })
    }
    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

