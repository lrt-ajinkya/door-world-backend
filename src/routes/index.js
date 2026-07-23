const express = require("express");

const userRoutes = require("./users");
const excelRoutes = require("./excel");
const productRoutes = require("./products");
const specificationRoutes = require("./specifications");
const draftRoutes = require("./drafts");
const translationRoutes = require("./translations");
const doorComponentsRoutes = require("./doorComponents");
const hardwareRoutes = require("./hardware");
const finishingRoutes = require("./finishing");
const accessoriesRoutes = require("./accessories");
const glassRoutes = require("./glass");
const uploadsRoutes = require("./uploads");
const router = express.Router();

router.use("/users", userRoutes);
router.use("/excel", excelRoutes);
router.use("/products", productRoutes);
router.use("/specifications", specificationRoutes);
router.use("/drafts", draftRoutes);
router.use("/translations", translationRoutes);
router.use("/door-components", doorComponentsRoutes);
router.use("/hardware", hardwareRoutes);
router.use("/finishing", finishingRoutes);
router.use("/accessories", accessoriesRoutes);
router.use("/glass", glassRoutes);
router.use("/uploads", uploadsRoutes);

module.exports = router;
