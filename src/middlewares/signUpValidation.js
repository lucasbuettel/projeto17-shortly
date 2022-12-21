import { connection } from "../database/db.js";
import { signUpSchema } from "../models/signUpSchema.js";

export default async function signUpnValidation (req, res, next){
    const{name, email, password, confirmPassword} = req.body;

    const { error } = signUpSchema.validate(req.body, { abortEarly: false });
    
    if (error) {
        const errors = error.details.map((detail) => detail.message);
        return res.status(422).send(errors);
    }

    if (password !== confirmPassword){
        return res.sendStatus(401);
    }

    const emailExists = await connection.query('SELECT * FROM users WHERE email = $1', [email]);

    if(emailExists.rows[0]){
        res.sendStatus(409);
        return
    }

    req.user = req.body;

    next();
}