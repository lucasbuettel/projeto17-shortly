import { Router } from "express";
import { shortUrl, getUrl } from "../controllers/urlsShortenControllers.js";

const router = Router();

router.post("/urls/shorten", shortUrl)
router.get("/urls/:id", getUrl)

export default router;