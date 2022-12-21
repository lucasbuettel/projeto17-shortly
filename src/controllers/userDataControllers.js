import { connection } from "../database/db.js";
import bcrypt from "bcrypt";
import { v4 as uuidV4 } from "uuid";

export async function postSignUp(req, res){

    const {name, email, password} = req.user;


    try{

        const passwordHash = bcrypt.hashSync(password, 10);
        await connection.query(`
        INSERT INTO users (name, email, password) 
        VALUES ($1, $2, $3)`, [name, email, passwordHash]);

        res.sendStatus(201);
        

    }catch(err){

        res.status(409).send(err.message);
        return
    }


}

export async function postSignIn(req, res){

    const idUser = req.userId;

    const token = uuidV4();

    try{
        await connection.query(`
        INSERT INTO session ("idUser", token) 
        VALUES ($1, $2)`, [idUser, token]);

        res.sendStatus(200);
        
    }catch(err){
        
        res.status(400).send(err.message);
        return
        
    }


}