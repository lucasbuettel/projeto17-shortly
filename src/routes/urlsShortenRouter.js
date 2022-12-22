import { Router } from "express";
import { shortUrl, getUrl } from "../controllers/urlsShortenControllers.js";
import urlsShortenValidation from "../middlewares/urlsShortenValidation.js";

const router = Router();

router.post("/urls/shorten", urlsShortenValidation, shortUrl)
router.get("/urls/:id", getUrl)

export default router;