import joi from "joi";

export const urlsShortenSchema = joi.object(
    {
    url: joi.string().required().uri()
    }
)