import joi from "joi";

export const signUpSchema = joi.object(
    {
    email: joi.string().required().min(9).max(50),
    password:joi.string().required().max(15),
    }
)