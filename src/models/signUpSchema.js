import joi from "joi";

export const signUpSchema = joi.object(
    {
    name: joi.string().required().min(2).max(50),
    email: joi.string().required().min(9).max(50),
    password:joi.string().required().max(15),
    confirmPassword: joi.string().required().max(15)
    }
)