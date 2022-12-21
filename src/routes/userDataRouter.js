import { Router } from "express";
import { postSignUp, postSignIn } from "../controllers/userDataControllers.js";
import signInValidation from "../middlewares/signInValidation.js";
import signUpnValidation from "../middlewares/signUpValidation.js";

const router = Router();

router.post("/signup",  signUpnValidation, postSignUp);
router.post("/signin", signInValidation, postSignIn);

export default router;