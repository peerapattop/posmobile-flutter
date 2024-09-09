import express from "express";
import { login, register, getUserById } from "../controllers/userController.js";

const userRouter = express.Router();

userRouter.post("/login", login);
userRouter.post("/register", register);
userRouter.get("/:id", getUserById);

export default userRouter