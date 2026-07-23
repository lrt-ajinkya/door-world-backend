const express = require('express');
const router = express.Router();
const draftService = require('../services/draftService');
const { authenticateToken } = require('../middleware/auth');

// Apply authentication middleware to all routes
router.use(authenticateToken);

// Get all drafts for current user
router.get('/', async (req, res) => {
  try {
    const userEmail = req.user.email;
    
    const drafts = await draftService.getDraftsByUserEmail(userEmail);
    
    res.json(drafts);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get single draft
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const draft = await draftService.getDraft(id, userEmail, isAdmin);
    res.json(draft);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message === 'Access denied to this draft') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Create new draft
router.post('/', async (req, res) => {
  try {
    const userId = req.user.id;
    const userEmail = req.user.email;
    
    const draft = await draftService.createDraft(
      req.body, 
      userId, 
      userEmail
    );
    
    res.status(201).json(draft);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update draft
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const draft = await draftService.updateDraft(
      id, 
      req.body, 
      userEmail, 
      isAdmin
    );
    
    res.json(draft);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message === 'Access denied to this draft') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Delete draft
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const result = await draftService.deleteDraft(id, userEmail, isAdmin);
    res.json(result);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message === 'Access denied to this draft') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Copy draft
router.post('/:id/copy', async (req, res) => {
  try {
    const { id } = req.params;
    const { name } = req.body;
    const userId = req.user.id;
    const userEmail = req.user.email;
    
    const draft = await draftService.copyDraft(
      id, 
      userEmail, 
      userId, 
      name
    );
    
    res.status(201).json(draft);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message === 'Access denied to this draft') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Share draft
router.post('/:id/share', async (req, res) => {
  try {
    const { id } = req.params;
    const { emails } = req.body;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    if (!emails || !Array.isArray(emails)) {
      return res.status(400).json({ error: 'emails array is required' });
    }
    
    const draft = await draftService.shareDraft(
      id, 
      emails, 
      userEmail, 
      isAdmin
    );
    
    res.json(draft);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message.includes('Access denied')) {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Remove access to draft
router.post('/:id/remove-access', async (req, res) => {
  try {
    const { id } = req.params;
    const { emails } = req.body;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    if (!emails || !Array.isArray(emails)) {
      return res.status(400).json({ error: 'emails array is required' });
    }
    
    const draft = await draftService.removeAccess(
      id, 
      emails, 
      userEmail, 
      isAdmin
    );
    
    res.json(draft);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message.includes('Access denied')) {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Auto-save draft
router.post('/autosave', async (req, res) => {
  try {
    const userId = req.user.id;
    const userEmail = req.user.email;
    
    const draft = await draftService.autoSaveDraft(
      req.body, 
      userId, 
      userEmail
    );
    
    res.json(draft);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Convert draft to specification
router.post('/:id/convert', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const specification = await draftService.convertDraftToSpecification(
      id, 
      userEmail, 
      isAdmin
    );
    
    res.status(201).json(specification);
  } catch (error) {
    if (error.message === 'Draft not found' || error.message === 'Access denied to this draft') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Get drafts by user
router.get('/user/:userId', async (req, res) => {
  try {
    const { userId } = req.params;
    const isAdmin = req.user.isAdmin || false;
    
    // Only admin or the user themselves can access this
    if (!isAdmin && req.user.id !== userId) {
      return res.status(403).json({ error: 'Access denied' });
    }
    
    const drafts = await draftService.getDraftsByUser(userId);
    res.json(drafts);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get draft statistics
router.get('/stats/summary', async (req, res) => {
  try {
    const userId = req.user.id;
    const isAdmin = req.user.isAdmin || false;
    
    const stats = await draftService.getDraftStats(
      isAdmin ? null : userId, 
      isAdmin
    );
    
    res.json(stats);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;