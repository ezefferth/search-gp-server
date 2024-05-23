
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class LerAcessos {
  async handle(request: Request, response: Response) {

    try {

      const acessos = await prismaClient.acessos.findMany()

      return response.status(200).json(acessos)
    }

    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(200).json(e.code)
      }
    }
  }
}

