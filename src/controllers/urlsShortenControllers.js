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

    const {id} = req.params;
    

    try{
        const urlExists = await connection.query(`
        SELECT id, "shortUrl", url FROM "shortLink"
        WHERE "shortLink".id = $1 `, [id]);


        
        if(!urlExists.rows[0]){
            return res.sendStatus(404);
        }
        res.status(200).send(urlExists.rows[0])

    }catch(err){
        
        res.status(400).send(err.message);
    }
}

export async function openUrl(req,res){
    const {shortUrl} = req.params;
    console.log(shortUrl);

    try{
        const urlExist = await connection.query(`
        SELECT * FROM "shortLink" WHERE
        "shortUrl" = $1`, [shortUrl]);
        
        if (!urlExist.rows[0]) {
            return res.sendStatus(404);
        }

        await connection.query(`UPDATE "shortLink" SET "counter" = $1
        WHERE "shortUrl" = $2`, [(urlExist.rows[0].counter + 1), shortUrl]);
        res.redirect(302, urlExist.rows[0].url);

        
    }catch(err){
        res.status(400).send(err.message);
    }

}


export async function deleteUrl(req, res) {
    const { id } = req.params;
    const { authorization } = req.headers;

    const token = authorization?.replace('Bearer ', '');
    if (!token) {
        return res.sendStatus(401);
    }

    try {
        const sessionExists = await connection.query(`SELECT * FROM session WHERE token = $1`,
            [token]);
            console.log(sessionExists.rows[0]);

        if (!sessionExists.rows[0]) {
            return res.sendStatus(422);
        }

        const urlExists = await connection.query(`SELECT * FROM "shortLink" WHERE id = $1`, [id]);
        console.log(urlExists.rows[0]);
        if (!urlExists.rows[0]) {
            return res.sendStatus(404);
        }

        if (sessionExists.rows[0].idUser !== urlExists.rows[0].userId) {
            return res.sendStatus(401);
        }

        await connection.query(`DELETE FROM "shortLink" WHERE id = $1`, [urlExists.rows[0].id]);

        res.sendStatus(204);
    } catch (error) {
        console.log(error.message);
    }

}