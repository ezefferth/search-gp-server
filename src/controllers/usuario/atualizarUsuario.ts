
import { Request, Response } from 'express'
import { Prisma } from '@prisma/client'
import { prismaClient } from '../../data/prismaClient'

export class AtualizarUsuario {
  async handle(request: Request, response: Response) {
    const { id, nome, nome_login, fk_setor } = request.body

    try {
      const usuario = await prismaClient.usuario.update({
        where: {
          id: id
        },
        data: {
          nome,
          nome_login,
          fk_setor
        }
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

