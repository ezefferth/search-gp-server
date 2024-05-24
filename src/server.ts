import express from 'express';
import cors from 'cors'

import { router } from './routes';


const app = express();

app.use(express.json());
app.use(router);

app.use(cors({
  origin: 'http://localhost:5173',
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Origin', 'X-Requested-With', 'Content-Type', 'Accept'],
}));

app.listen(4003, () => {
  console.log('Servidor rodando na porta 4003');
});