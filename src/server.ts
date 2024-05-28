import express from 'express';
import cors from 'cors'

import { router } from './routes';


const app = express();

const corsOptions = {
  origin: '*',                  //todas url/ colocar a url final aki
  credentials: true,            //access-control-allow-credentials:true
  optionSuccessStatus: 200,
}

app.use(cors(corsOptions))

app.use(express.json());
app.use(router);


app.listen(4003, () => {
  console.log('Servidor rodando na porta 4003');
});