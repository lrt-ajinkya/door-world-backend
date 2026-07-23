const express = require('express');
const router = express.Router();
const translationService = require('../services/translationService');
const { authenticateToken } = require('../middleware/auth');

// Get translations (public endpoint for frontend)
router.get('/', async (req, res) => {
  try {
    const { language = 'en', category, format = 'object' } = req.query;
    
    let translations;
    if (category) {
      translations = await translationService.getTranslationsByCategory(category, language);
    } else {
      translations = await translationService.getTranslations(language, category);
    }
    
    res.json(translations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all translations with full data (admin only)
router.get('/admin/all', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const translations = await translationService.getAllTranslations();
    res.json(translations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get single translation by ID
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const translation = await translationService.getTranslation(parseInt(id));
    res.json(translation);
  } catch (error) {
    if (error.message === 'Translation not found') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Create new translation (admin only)
router.post('/', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const translation = await translationService.createTranslation(req.body);
    res.status(201).json(translation);
  } catch (error) {
    if (error.message === 'Translation key already exists') {
      res.status(400).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Update translation (admin only)
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const { id } = req.params;
    
    const translation = await translationService.updateTranslation(parseInt(id), req.body);
    res.json(translation);
  } catch (error) {
    if (error.message === 'Translation not found') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Delete translation (admin only)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const { id } = req.params;
    
    const result = await translationService.deleteTranslation(parseInt(id));
    res.json(result);
  } catch (error) {
    if (error.message === 'Translation not found') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Search translations
router.get('/search/:term', async (req, res) => {
  try {
    const { term } = req.params;
    const { language = 'en' } = req.query;
    
    const translations = await translationService.searchTranslations(term, language);
    res.json(translations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get translation categories
router.get('/admin/categories', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const categories = await translationService.getCategories();
    res.json(categories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Bulk create translations (admin only)
router.post('/admin/bulk-create', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const { translations } = req.body;
    
    if (!translations || !Array.isArray(translations)) {
      return res.status(400).json({ error: 'translations array is required' });
    }
    
    const result = await translationService.bulkCreateTranslations(translations);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Bulk update translations (admin only)
router.put('/admin/bulk-update', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const { translations } = req.body;
    
    if (!translations || !Array.isArray(translations)) {
      return res.status(400).json({ error: 'translations array is required' });
    }
    
    const result = await translationService.bulkUpdateTranslations(translations);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Export translations (admin only)
router.get('/admin/export', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const { language, category, format = 'json' } = req.query;
    
    const translations = await translationService.exportTranslations(language, category);
    
    if (format === 'csv') {
      // Convert to CSV format
      res.setHeader('Content-Type', 'text/csv');
      res.setHeader('Content-Disposition', 'attachment; filename=translations.csv');
      
      let csv = 'Key,Category,English,Lithuanian,Description\n';
      if (Array.isArray(translations)) {
        translations.forEach(t => {
          csv += `"${t.key}","${t.category || ''}","${t.en || ''}","${t.lt || ''}","${t.description || ''}"\n`;
        });
      }
      res.send(csv);
    } else {
      res.json(translations);
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Import translations (admin only)
router.post('/admin/import', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const { translations, overwrite = false } = req.body;
    
    if (!translations || !Array.isArray(translations)) {
      return res.status(400).json({ error: 'translations array is required' });
    }
    
    const result = await translationService.importTranslations(translations, overwrite);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get translation statistics (admin only)
router.get('/admin/stats', authenticateToken, async (req, res) => {
  try {
    const isAdmin = req.user.isAdmin || false;
    
    if (!isAdmin) {
      return res.status(403).json({ error: 'Admin access required' });
    }
    
    const stats = await translationService.getTranslationStats();
    res.json(stats);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;