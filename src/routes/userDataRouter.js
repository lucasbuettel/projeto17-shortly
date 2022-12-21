import { Router } from "express";
import { postSignUp, postSignIn } from "../controllers/userDataControllers.js";
import signUpnValidation from "../middlewares/signUpValidation.js";

const router = Router();

router.post("/signup",  signUpnValidation, postSignUp);
router.post("/signin", postSignIn);

export default router;