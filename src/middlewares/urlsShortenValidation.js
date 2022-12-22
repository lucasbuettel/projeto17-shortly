import { connection } from "../database/db.js";
import { urlsShortenSchema } from "../models/usrlsShortenSchema.js";

export default async function urlsShortenValidation(req,res, next){

    const {authorization} = req.headers;
    const {url} = req.body;
    const token = authorization?.replace('Bearer ', '');

    const {error} = urlsShortenSchema.validate(req.body, {abortEarly:false})

    if(error){
        const errors = error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }

    if(!token){
        return res.sendStatus(401);
    }

    let verifyOnline;

    try{
        const sessionExists = await connection.query(`
        SELECT * FROM session 
        WHERE token=$1`, [token]
        );

    if(!sessionExists.rows[0]){
        return sendStatus(422);
    }

    verifyOnline = sessionExists.rows[0];

    const userExists = await connection.query(`SELECT * FROM users WHERE id = $1`,
            [verifyOnline.idUser]);
        if (!userExists) {
            return res.sendStatus(422);
        }

    } catch(err){
        res.sendStatus(401);
    }

    console.log(verifyOnline)
    req.info = {url, verifyOnline};

    next();

}