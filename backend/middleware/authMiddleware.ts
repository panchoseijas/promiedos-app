import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

const authMiddleware = (req: any, res: Response, next: NextFunction) => {
  const token = req.headers.authorization?.split(" ")[1];

  if (!token) {
    res.status(401).json({ message: "No token provided" });
    return;
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET as string);
    req.body.userId = (decoded as jwt.JwtPayload).id;
    next();
  } catch (error) {
    console.log("error", JSON.stringify(error, null, 2));
    res.status(401).json({ message: "Invalid token" });
    return;
  }
};

export default authMiddleware;
