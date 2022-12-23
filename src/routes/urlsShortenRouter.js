import { Router } from "express";
import { shortUrl, getUrl, openUrl, deleteUrl } from "../controllers/urlsShortenControllers.js";
import urlsShortenValidation from "../middlewares/urlsShortenValidation.js";

const router = Router();

router.post("/urls/shorten", urlsShortenValidation, shortUrl);
router.get("/urls/:id", getUrl);
router.get("/urls/open/:shortUrl", openUrl);
router.delete("/urls/:id", deleteUrl);


export default router;