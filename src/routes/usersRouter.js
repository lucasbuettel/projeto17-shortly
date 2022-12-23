import { Router } from "express";
import { listUrls, ranking } from "../controllers/usersControllers.js";

const router = Router();

router.get("/users/me", listUrls);

router.get("/ranking", ranking);

export default router;

