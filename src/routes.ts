import { Router } from "express";

import { LerAcoes } from "./controllers/acoes/lerAcoes";
import { AtualizarAcoes } from "./controllers/acoes/atualizarAcoes";
import { DeletarAcoes } from "./controllers/acoes/deletarAcoes";

import { LerAcessos } from "./controllers/acessos/lerAcessos";
import { AtualizarAcessos } from "./controllers/acessos/atualizarAcesso";

import { InserirGrupo } from "./controllers/grupo/inserirGrupo";
import { DeletarGrupo } from "./controllers/grupo/deletarGrupo";
import { AtualizarGrupo } from "./controllers/grupo/atualizarGrupo";
import { LerGrupos } from "./controllers/grupo/lerGrupos";

import { InserirUsuario } from "./controllers/usuario/inserirUsuario";
import { DeletarUsuario } from "./controllers/usuario/deletarUsuario";
import { LerUsuarios } from "./controllers/usuario/lerUsuarios";
import { AtualizarUsuario } from "./controllers/usuario/atualizarUsuario";

import { InserirSetor } from "./controllers/setor/inserirSetor";
import { DeletarSetor } from "./controllers/setor/deletarSetor";
import { LerSetores } from "./controllers/setor/lerSetores";
import { AtualizarSetor } from "./controllers/setor/atualizarSetor";

const router = Router();

const lerAcoes = new LerAcoes();
const atualizarAcoes = new AtualizarAcoes();
const deletarAcoes = new DeletarAcoes();

const lerAcessos = new LerAcessos();
const atualizarAcessos = new AtualizarAcessos();

const inserirGrupo = new InserirGrupo();
const atualizarGrupo = new AtualizarGrupo();
const deletarGrupo = new DeletarGrupo();
const lerGrupos = new LerGrupos();


const inserirUsuario = new InserirUsuario();
const atualizarUsuario = new AtualizarUsuario();
const deletarUsuario = new DeletarUsuario();
const lerUsuarios = new LerUsuarios();

const inserirSetor = new InserirSetor();
const atualizarSetor = new AtualizarSetor();
const deletarSetor = new DeletarSetor()
const lerSetores = new LerSetores();

router.get("/lerAcoes", lerAcoes.handle)
router.post("/atualizarAcoes", atualizarAcoes.handle)
router.delete("/deletarAcoes", deletarAcoes.handle)

router.get("/lerAcessos", lerAcessos.handle)
router.post("/atualizarAcessos", atualizarAcessos.handle)

router.post("/inserirGrupo", inserirGrupo.handle);
router.post("/atualizarGrupo", atualizarGrupo.handle)
router.get("/lerGrupos", lerGrupos.handle)
router.delete("/deletarGrupo", deletarGrupo.handle)

router.post("/inserirUsuario", inserirUsuario.handle);
router.post("/atualizarUsuario", atualizarUsuario.handle)
router.delete("/deletarUsuario", deletarUsuario.handle)
router.get("/lerUsuarios", lerUsuarios.handle)

router.post("/inserirSetor", inserirSetor.handle);
router.post("/atualizarSetor", atualizarSetor.handle)
router.delete("/deletarSetor", deletarSetor.handle)
router.get("/lerSetores", lerSetores.handle)

export { router }





