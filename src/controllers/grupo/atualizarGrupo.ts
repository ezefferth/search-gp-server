
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class AtualizarGrupo {
  async handle(request: Request, response: Response) {
    const { id, nome } = request.body
    try {
      const grupo = await prismaClient.grupo.update({
        where: {
          id: id
        },
        data: {
          nome,
        },
      })
      return response.status(200).json(grupo)
    }
    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

