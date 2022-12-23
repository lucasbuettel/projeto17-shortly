import { connection } from "../database/db.js";


export async function listUrls(req, res) {
    const { authorization } = req.headers;

    const token = authorization?.replace('Bearer ', '');
    if (!token) {
        return res.sendStatus(401);
    }

    try {
        let arr = [];
        const userExist = await connection.query(`SELECT "idUser" FROM session WHERE token = $1`, [token]);
        if (!userExist.rows[0]) {
            res.sendStatus(404);
        }
        const userCounts = await connection.query(`SELECT users.id, users.name,
         SUM("shortLink".counter) AS "visitCount" FROM users
         JOIN "shortLink" ON users.id = "shortLink"."userId" 
         WHERE users.id = $1
         GROUP BY users.id`, [userExist.rows[0].idUser]);

        if (!userCounts.rows[0]) {
            res.sendStatus(404);
        }

        const { id, name, visitCount } = userCounts.rows[0];
        const userUrls = await connection.query(`SELECT id, "shortUrl", url, counter
        FROM "shortLink" WHERE "shortLink"."userId" = $1 ORDER BY id`, [userExist.rows[0].idUser]);

        for (let i = 0; i < userUrls.rows.length; i++) {
            arr.push(userUrls.rows[i]);
        }

        const myUrls = {
            id,
            name,
            visitCount: visitCount,
            shortenedUrls: arr
        }
        
        res.send(myUrls);
    } catch (error) {
        console.log(error.message);
    }
}

export async function ranking(req, res) {
    try {
        const rank = await connection.query(`SELECT users.id, users.name,
        COUNT(counter) AS "linksCount",
        COALESCE(SUM(counter),0) AS "visitCount" FROM
        users LEFT JOIN "shortLink" ON "shortLink"."userId" = users.id 
        GROUP BY users.name, users.id, "shortLink".counter
        ORDER BY counter LIMIT 10`);

        res.status(200).send(rank.rows);
    } catch (error) {
        console.log(error.message);
    }

}