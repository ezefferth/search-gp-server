
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class InserirUsuario {
  async handle(request: Request, response: Response) {
    const { nome, fk_setor, nome_login } = request.body

    try {
      const usuario = await prismaClient.usuario.create({
        data: {
          nome,
          fk_setor,
          nome_login,
          acesso: {
            create: {
              
            }
          }
        },
      })
      return response.status(200).json(usuario)
    }
    catch (e) {
      if (e instanceof Prisma.PrismaClientKnownRequestError) {
        // The .code property can be accessed in a type-safe manner
        return response.status(409).json(e.code)
      }
    }
  }
}

