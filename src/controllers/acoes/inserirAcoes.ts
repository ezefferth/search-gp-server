
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class InserirGrupo {
  async handle(request: Request, response: Response) {
    const { nome } = request.body
    try {
      const grupo = await prismaClient.grupo.create({
        data: {
          nome,
          acesso: {
            create: {
              
            }
          }
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

