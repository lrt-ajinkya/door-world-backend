const express = require('express');
const router = express.Router();
const glassService = require('../services/glassService');

// Get glass types
router.get('/glass-types', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const glassTypes = await glassService.getGlassTypes(language);
    res.json(glassTypes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass type new
router.get('/glass-type-new', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const glassTypeNew = await glassService.getGlassTypeNew(language);
    res.json(glassTypeNew);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass new
router.get('/glass-new', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const glassNew = await glassService.getGlassNew(language);
    res.json(glassNew);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get main glass options
router.get('/glass', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const glass = await glassService.getGlass(language);
    res.json(glass);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass addon types
router.get('/glass-addon-types', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const addonTypes = await glassService.getGlassAddonTypes(language);
    res.json(addonTypes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass addon
router.get('/glass-addon', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const addon = await glassService.getGlassAddon(language);
    res.json(addon);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass film
router.get('/glass-film', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const film = await glassService.getGlassFilm(language);
    res.json(film);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass bulletproof sizes
router.get('/glass-bulletproof-sizes', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const sizes = await glassService.getGlassBulletProofSizes(language);
    res.json(sizes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass shape bulletproof
router.get('/glass-shape-bulletproof', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const shapes = await glassService.getGlassShapeBulletproof(language);
    res.json(shapes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get glass by ID
router.get('/glass/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { language = 'en' } = req.query;
    const glass = await glassService.getGlassById(id, language);
    
    if (!glass) {
      return res.status(404).json({ error: 'Glass not found' });
    }
    
    res.json(glass);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get default glass
router.get('/glass/default', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const defaultGlass = await glassService.getDefaultGlass(language);
    
    if (!defaultGlass) {
      return res.status(404).json({ error: 'Default glass not found' });
    }
    
    res.json(defaultGlass);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all glass options
router.get('/glass-all', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const allOptions = await glassService.getAllGlassOptions(language);
    res.json(allOptions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Search glass options
router.get('/glass/search', async (req, res) => {
  try {
    const { q: searchTerm, language = 'en' } = req.query;
    
    if (!searchTerm) {
      return res.status(400).json({ error: 'Search term is required' });
    }
    
    const results = await glassService.searchGlass(searchTerm, language);
    res.json(results);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;