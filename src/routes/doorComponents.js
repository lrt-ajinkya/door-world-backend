const express = require('express');
const router = express.Router();
const doorComponentsService = require('../services/doorComponentsService');

// Get all door types
router.get('/door-types', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const doorTypes = await doorComponentsService.getDoorTypes(language);
    res.json(doorTypes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door type prices
router.get('/door-type-prices', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const doorTypePrices = await doorComponentsService.getDoorTypePrices(language);
    res.json(doorTypePrices);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door models
router.get('/door-models', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const doorModels = await doorComponentsService.getDoorModels(language);
    res.json(doorModels);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door colors by type
router.get('/door-colors', async (req, res) => {
  try {
    const { type = 'pvc', language = 'en' } = req.query;
    const colors = await doorComponentsService.getDoorColors(type, language);
    res.json(colors);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get dimensions by door model
router.get('/dimensions', async (req, res) => {
  try {
    const { model = 'classic', language = 'en' } = req.query;
    const dimensions = await doorComponentsService.getDimensions(model, language);
    res.json(dimensions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get exploitation conditions
router.get('/exploitation-conditions', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const conditions = await doorComponentsService.getExploitationConditions(language);
    res.json(conditions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door openings
router.get('/door-openings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const doorOpenings = await doorComponentsService.getDoorOpenings(language);
    res.json(doorOpenings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door types actual
router.get('/door-types-actual', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const doorTypesActual = await doorComponentsService.getDoorTypesActual(language);
    res.json(doorTypesActual);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door finishings and millings
router.get('/door-finishings-and-millings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const finishings = await doorComponentsService.getDoorFinishingsAndMillings(language);
    res.json(finishings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get bulletproof models
router.get('/bulletproof-models', async (req, res) => {
  try {
    const bulletproofModels = await doorComponentsService.getBulletproofModels();
    res.json(bulletproofModels);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;