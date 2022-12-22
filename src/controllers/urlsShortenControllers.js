import { connection } from "../database/db.js";
import { nanoid } from "nanoid";

export async function shortUrl(req, res){

    const {url, verifyOnline} = req.info;

    try{ 
        const shortenedLink = nanoid(10);

        await connection.query(`
        INSERT INTO "shortLink" ("userId", "seesionId", "shortUrl", url)
        VALUES ($1, $2, $3, $4) `,[verifyOnline.idUser, verifyOnline.id, shortenedLink, url])

        res.send(shortenedLink);

    } catch(err){
        res.status(400).send(err.message);
    }







}

export async function getUrl(req, res){

}
