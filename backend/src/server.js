import express from 'express';
import cors from 'cors';
import { Prisma } from './lib/prisma.ts';

const PORT = 3000
const app = express();

app.use(express.json());
app.use(cors());




app.listen(PORT, ()=>{
    console.log('server rodando na porta 3000')
})