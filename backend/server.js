import express from "express";
import cors from "cors";
import connectDB from "./config/db.js";
import userRouter from "./routes/userRoute.js";
import 'dotenv/config'

//app config
const app = express();

//middleware
app.use(express.json());
app.use(cors());


// connect to database
connectDB();

// api endpoints
app.use("/api/user",userRouter);

app.get('/', (req, res) => {
  res.send('Hello, World!');
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
