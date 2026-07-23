const express = require('express');
const router = express.Router();
const accessoriesService = require('../services/accessoriesService');

// Get architraves
router.get('/architraves', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const architraves = await accessoriesService.getArchitraves(language);
    res.json(architraves);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get architraves by group
router.get('/architraves/by-group/:group', async (req, res) => {
  try {
    const { group } = req.params;
    const { language = 'en' } = req.query;
    const architraves = await accessoriesService.getArchitravesByGroup(group, language);
    res.json(architraves);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get thresholds
router.get('/thresholds', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const thresholds = await accessoriesService.getThresholds(language);
    res.json(thresholds);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get thresholds by group
router.get('/thresholds/by-group/:group', async (req, res) => {
  try {
    const { group } = req.params;
    const { language = 'en' } = req.query;
    const thresholds = await accessoriesService.getThresholdsByGroup(group, language);
    res.json(thresholds);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get threshold options
router.get('/threshold-options', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const options = await accessoriesService.getThresholdOptions(language);
    res.json(options);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get other accessories
router.get('/other-accessories', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const accessories = await accessoriesService.getOtherAccessories(language);
    res.json(accessories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get other accessories by group
router.get('/other-accessories/by-group/:group', async (req, res) => {
  try {
    const { group } = req.params;
    const { language = 'en' } = req.query;
    const accessories = await accessoriesService.getOtherAccessoriesByGroup(group, language);
    res.json(accessories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get architrave by ID
router.get('/architraves/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { language = 'en' } = req.query;
    const architrave = await accessoriesService.getArchitraveById(id, language);
    
    if (!architrave) {
      return res.status(404).json({ error: 'Architrave not found' });
    }
    
    res.json(architrave);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get threshold by ID
router.get('/thresholds/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { language = 'en' } = req.query;
    const threshold = await accessoriesService.getThresholdById(id, language);
    
    if (!threshold) {
      return res.status(404).json({ error: 'Threshold not found' });
    }
    
    res.json(threshold);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get architraves by door types
router.post('/architraves/by-door-types', async (req, res) => {
  try {
    const { doorTypes = [] } = req.body;
    const { language = 'en' } = req.query;
    const architraves = await accessoriesService.getArchitravesByDoorTypes(doorTypes, language);
    res.json(architraves);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get thresholds by door types
router.post('/thresholds/by-door-types', async (req, res) => {
  try {
    const { doorTypes = [] } = req.body;
    const { language = 'en' } = req.query;
    const thresholds = await accessoriesService.getThresholdsByDoorTypes(doorTypes, language);
    res.json(thresholds);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;