import express from "express";
import {getAttractionByID, getAttractions} from "../controllers/attraction.controller.js";
let attraction_router = express.Router();

attraction_router.get("/", getAttractions);
attraction_router.get("/:id", getAttractionByID);

export default attraction_router;