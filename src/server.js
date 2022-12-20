import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { connection } from "./database/db";
dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());


// ROTAS:

const port = 5000;
app.listen(port, () => console.log(`Server running in port: ${port}`));