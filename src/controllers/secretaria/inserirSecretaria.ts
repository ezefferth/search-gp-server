
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class InserirSecretaria {
  async handle(request: Request, response: Response) {
    const { nome } = request.body
    try {
      const secretaria = await prismaClient.secretaria.create({
        data: {
          nome,
        },
      })
      return response.status(200).json(secretaria)
    }
    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

