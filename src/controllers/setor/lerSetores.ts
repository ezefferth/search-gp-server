
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class LerSetores {
  async handle(request: Request, response: Response) {

    try {

      const setor = await prismaClient.setor.findMany({
        orderBy: {
          nome: 'asc'
        }
      })

      return response.status(200).json(setor)
    }

    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

