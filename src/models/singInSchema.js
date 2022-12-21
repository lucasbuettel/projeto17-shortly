import joi from "joi";

export const signInSchema = joi.object(
    {
    email: joi.string().required().min(9).max(50),
    password:joi.string().required().max(15)
    }
)