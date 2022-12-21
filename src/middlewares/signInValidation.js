import { connection } from "../database/db.js";
import { signInSchema } from "../models/singInSchema.js";
import bcrypt from "bcrypt";

export default async function signInValidation(req, res, next){

    const {email, password} = req.body;

    const {error} = signInSchema.validate(req.body, {abortEarly:false});

    if(error){
        const errors = error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }

    const emailExists = await connection.query(`
    SELECT * FROM users 
    WHERE email = $1`, [email]);

    if(!emailExists.rows[0]){
        res.sendStatus(401);
        return
    }

    const verifyPassword = bcrypt.compareSync(password, emailExists.rows[0].password);

    if(!verifyPassword){
        res.sendStatus(401);
        return
    }
    
    req.userId = emailExists.rows[0].id;
    
    next();


}