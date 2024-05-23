
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class AtualizarAcoes {
  async handle(request: Request, response: Response) {
    const { id, ...data } = request.body;

    try {
      const acoes = await prismaClient.acoes.update({
        where: {
          id: id,
        },

        data: data
      })
      return response.status(200).json(acoes)
    }
    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

