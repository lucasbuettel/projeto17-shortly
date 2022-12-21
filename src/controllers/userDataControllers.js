import { connection } from "../database/db.js";
import bcrypt from "bcrypt";


export async function postSignUp(req, res){

    const {name, email, password} = req.user;


    try{

        const passwordHash = bcrypt.hashSync(password, 10);
        await connection.query(`
        INSERT INTO users (name, email, password) 
        VALUES ($1, $2, $3)`, [name, email, passwordHash]);

        res.sendStatus(201);
        

    }catch(err){

        return res.status(409).send(err.message);
        
    }


}

export async function postSignIn(req, res){

    const {email, password} = req.body;



    try{
        const userExists = connection.query("SELECT name, password FROM users")
        
        await connection.query(`
        INSERT INTO session ("idUser", token) 
        VALUES ($1, $2)`, [idUser, token]);

        res.sendStatus(201);
        

    }catch(err){
        
        res.status(409).send(err.message);
        
    }


}