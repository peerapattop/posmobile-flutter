import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
    fullName: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true //อีเมลห้ามซ้ำกัน
    },
    password: {
        type: String,
        required: true
    },
    role: {
        type: String,
        required: true,
        enum: ['user', 'admin']
    },
    phoneNumber: {
        type: String
    }
},)

const userModel = mongoose.model.user || mongoose.model("user", userSchema);

export default userModel;