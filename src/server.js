import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { connection } from "./database/db.js";

import userDataRouter from  "./routes/userDataRouter.js"
import urlsShortenRouter from "./routes/urlsShortenRouter.js"
import usersRouter from "./routes/usersRouter.js"


dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

app.use(userDataRouter);
app.use(urlsShortenRouter);
app.use(usersRouter);

const port = 4000;
app.listen(port, () => console.log(`Server running in port: ${port}`));