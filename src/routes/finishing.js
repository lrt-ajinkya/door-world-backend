const express = require('express');
const router = express.Router();
const finishingService = require('../services/finishingService');

// Get finishings
router.get('/finishings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const finishings = await finishingService.getFinishings(language);
    res.json(finishings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get millings
router.get('/millings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const millings = await finishingService.getMillings(language);
    res.json(millings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get milling images
router.get('/milling-images', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const images = await finishingService.getMillingImages(language);
    res.json(images);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door finishings and millings
router.get('/door-finishings-and-millings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const combinations = await finishingService.getDoorFinishingsAndMillings(language);
    res.json(combinations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get finishing by ID
router.get('/finishings/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { language = 'en' } = req.query;
    const finishing = await finishingService.getFinishingById(id, language);
    
    if (!finishing) {
      return res.status(404).json({ error: 'Finishing not found' });
    }
    
    res.json(finishing);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get milling by ID
router.get('/millings/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { language = 'en' } = req.query;
    const milling = await finishingService.getMillingById(id, language);
    
    if (!milling) {
      return res.status(404).json({ error: 'Milling not found' });
    }
    
    res.json(milling);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get finishings by color type
router.get('/finishings/by-color/:colorType', async (req, res) => {
  try {
    const { colorType } = req.params;
    const { language = 'en' } = req.query;
    const finishings = await finishingService.getFinishingsByColorType(colorType, language);
    res.json(finishings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get finishings with carvings
router.get('/finishings/with-carvings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const finishings = await finishingService.getFinishingsWithCarvings(language);
    res.json(finishings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get carvings
router.get('/carvings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const carvings = await finishingService.getCarvings(language);
    res.json(carvings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;