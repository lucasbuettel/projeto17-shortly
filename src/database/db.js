import pkg from 'pg';
import dotenv from "dotenv";

dotenv.config();

const {Pool} = pkg;


export const connection = new Pool({
    host: 'localhost',
    port: process.env.PORT,
    user: 'postgres',
    password: process.env.PASSWORD,
    database: 'shortly'
  });