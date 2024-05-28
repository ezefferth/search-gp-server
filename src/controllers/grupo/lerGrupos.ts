
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class LerGrupos {
  async handle(request: Request, response: Response) {

    try {

      const grupos = await prismaClient.grupo.findMany({
        orderBy: {
          nome: 'asc'
        }
      })

      return response.status(200).json(grupos)
    }

    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

