import userModel from "../models/userModel.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import validator from "validator";

// get user by id
const getUserById = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await userModel.findById(id);
    if (!user) {
      return res.json({ success: false, message: "User not found" });
    }
    res.json({ success: true, user });
  } catch (error) {
    res.json({ success: false, message: error.message });
  }
};
// login
const login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await userModel.findOne({ email });
    if (!user) {
      return res.json({ success: false, message: "User not found" });
    }
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.json({ success: false, message: "Incorrect credentials" });
    }
    const token = createToken(user._id);
    res.json({ success: true, token });
  } catch (error) {
    res.json({ success: false, message: error.message });
  }
};

//token
const createToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: "1d" });
};

// register
const register = async (req, res) => {
  const { fullName, email, password, phoneNumber, role } = req.body;

  try {
    // ตรวจสอบว่าผู้ใช้นี้มีอยู่ในระบบแล้วหรือไม่
    const exists = await userModel.findOne({ email });
    if (exists) {
      return res
        .status(400)
        .json({ success: false, message: "User already exists" });
    }

    // ตรวจสอบว่าอีเมลถูกต้องหรือไม่
    if (!validator.isEmail(email)) {
      return res.status(400).json({ success: false, message: "Invalid email" });
    }

    // ตรวจสอบความยาวของรหัสผ่าน
    if (password.length < 8) {
      return res.status(400).json({
        success: false,
        message: "Password must be at least 8 characters",
      });
    }

    // สร้าง salt และทำการแฮชรหัสผ่าน
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // สร้างผู้ใช้ใหม่
    const newUser = new userModel({
      fullName: fullName,
      email: email,
      password: hashedPassword,
      phoneNumber: phoneNumber || "",
      role: role || "admin",
    });

    // บันทึกผู้ใช้ใหม่ในฐานข้อมูล
    const user = await newUser.save();

    // สร้าง JWT token
    const token = createToken(user._id);

    // ตอบกลับด้วยข้อมูล token
    res.status(201).json({ success: true, token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: "Server error" });
  }
};

export { login, register,getUserById };
