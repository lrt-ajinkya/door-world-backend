const express = require('express');
const router = express.Router();
const specificationService = require('../services/specificationService');
const { authenticateToken } = require('../middleware/auth');

// Apply authentication middleware to all routes
router.use(authenticateToken);

// Get all specifications for current user
router.get('/', async (req, res) => {
  try {
    const userEmail = req.user.email;
    
    const specifications = await specificationService.getSpecificationsByUserEmail(userEmail);
    
    res.json(specifications);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get single specification
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const specification = await specificationService.getSpecification(id, userEmail, isAdmin);
    res.json(specification);
  } catch (error) {
    if (error.message === 'Specification not found' || error.message === 'Access denied to this specification') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Create new specification
router.post('/', async (req, res) => {
  try {
    const userId = req.user.id;
    const userEmail = req.user.email;
    
    const specification = await specificationService.createSpecification(
      req.body, 
      userId, 
      userEmail
    );
    
    res.status(201).json(specification);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update specification
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const specification = await specificationService.updateSpecification(
      id, 
      req.body, 
      userEmail, 
      isAdmin
    );
    
    res.json(specification);
  } catch (error) {
    if (error.message === 'Specification not found' || error.message === 'Access denied to this specification') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Delete specification
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    const result = await specificationService.deleteSpecification(id, userEmail, isAdmin);
    res.json(result);
  } catch (error) {
    if (error.message === 'Specification not found' || error.message === 'Access denied to this specification') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Copy specification
router.post('/:id/copy', async (req, res) => {
  try {
    const { id } = req.params;
    const { name } = req.body;
    const userId = req.user.id;
    const userEmail = req.user.email;
    
    const specification = await specificationService.copySpecification(
      id, 
      userEmail, 
      userId, 
      name
    );
    
    res.status(201).json(specification);
  } catch (error) {
    if (error.message === 'Specification not found' || error.message === 'Access denied to this specification') {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Share specification
router.post('/:id/share', async (req, res) => {
  try {
    const { id } = req.params;
    const { emails } = req.body;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    if (!emails || !Array.isArray(emails)) {
      return res.status(400).json({ error: 'emails array is required' });
    }
    
    const specification = await specificationService.shareSpecification(
      id, 
      emails, 
      userEmail, 
      isAdmin
    );
    
    res.json(specification);
  } catch (error) {
    if (error.message === 'Specification not found' || error.message.includes('Access denied')) {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Remove access to specification
router.post('/:id/remove-access', async (req, res) => {
  try {
    const { id } = req.params;
    const { emails } = req.body;
    const userEmail = req.user.email;
    const isAdmin = req.user.isAdmin || false;
    
    if (!emails || !Array.isArray(emails)) {
      return res.status(400).json({ error: 'emails array is required' });
    }
    
    const specification = await specificationService.removeAccess(
      id, 
      emails, 
      userEmail, 
      isAdmin
    );
    
    res.json(specification);
  } catch (error) {
    if (error.message === 'Specification not found' || error.message.includes('Access denied')) {
      res.status(404).json({ error: error.message });
    } else {
      res.status(500).json({ error: error.message });
    }
  }
});

// Get specifications by user
router.get('/user/:userId', async (req, res) => {
  try {
    const { userId } = req.params;
    const isAdmin = req.user.isAdmin || false;
    
    // Only admin or the user themselves can access this
    if (!isAdmin && req.user.id !== userId) {
      return res.status(403).json({ error: 'Access denied' });
    }
    
    const specifications = await specificationService.getSpecificationsByUser(userId);
    res.json(specifications);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get specification statistics
router.get('/stats/summary', async (req, res) => {
  try {
    const userId = req.user.id;
    const isAdmin = req.user.isAdmin || false;
    
    const stats = await specificationService.getSpecificationStats(
      isAdmin ? null : userId, 
      isAdmin
    );
    
    res.json(stats);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;