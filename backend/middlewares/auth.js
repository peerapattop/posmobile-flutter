import jwt from "jsonwebtoken";

const auth = async (req, res, next) => {
        const {token} = req.headers
        if(!token){
            return res.json({success: false, message: "No token provided Login Again"})
        }
        try{
            const decoded = jwt.verify(token, process.env.JWT_SECRET)
            req.body.userId = decoded.id;
            next()
        }catch(err){
            return res.json({success: false, message: err.message})
        }
};
export default auth