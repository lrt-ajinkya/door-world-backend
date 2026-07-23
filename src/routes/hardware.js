const express = require('express');
const router = express.Router();
const hardwareService = require('../services/hardwareService');

// Get hinges
router.get('/hinges', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const hinges = await hardwareService.getHinges(language);
    res.json(hinges);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get hinge accessories
router.get('/hinge-accessories', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const accessories = await hardwareService.getHingeAccessories(language);
    res.json(accessories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get hinge caps
router.get('/hinge-caps', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const caps = await hardwareService.getHingeCaps(language);
    res.json(caps);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get hinge cap finishings
router.get('/hinge-cap-finishings', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const finishings = await hardwareService.getHingeCapFinishings(language);
    res.json(finishings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get handles
router.get('/handles', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const handles = await hardwareService.getHandles(language);
    res.json(handles);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get main locks
router.get('/main-locks', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const locks = await hardwareService.getMainLocks(language);
    res.json(locks);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get extra locks
router.get('/extra-locks', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const locks = await hardwareService.getExtraLocks(language);
    res.json(locks);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get locks easy
router.get('/locks-easy', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const locks = await hardwareService.getLocksEasy(language);
    res.json(locks);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get locks smart
router.get('/locks-smart', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const locks = await hardwareService.getLocksSmart(language);
    res.json(locks);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get main lock accessories
router.get('/main-lock-accessories', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const accessories = await hardwareService.getMainLockAccessories(language);
    res.json(accessories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get locks easy accessories
router.get('/locks-easy-accessories', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const accessories = await hardwareService.getLocksEasyAccessories(language);
    res.json(accessories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get locks smart accessories
router.get('/locks-smart-accessories', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const accessories = await hardwareService.getLocksSmartAccessories(language);
    res.json(accessories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get cylinders
router.get('/cylinders', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const cylinders = await hardwareService.getCylinders(language);
    res.json(cylinders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get extra cylinders
router.get('/extra-cylinders', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const cylinders = await hardwareService.getExtraCylinders(language);
    res.json(cylinders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get electric strikes
router.get('/electric-strikes', async (req, res) => {
  try {
    const { language = 'en' } = req.query;
    const strikes = await hardwareService.getElectricStrikes(language);
    res.json(strikes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;