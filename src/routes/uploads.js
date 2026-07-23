const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const router = express.Router();

// Configure multer for logo uploads
const logoStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const uploadPath = path.join(__dirname, '../images/logos');
    // Ensure directory exists
    if (!fs.existsSync(uploadPath)) {
      fs.mkdirSync(uploadPath, { recursive: true });
    }
    cb(null, uploadPath);
  },
  filename: function (req, file, cb) {
    // Generate unique filename with timestamp
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const extension = path.extname(file.originalname);
    cb(null, 'logo-' + uniqueSuffix + extension);
  }
});

// File filter for images only
const imageFilter = (req, file, cb) => {
  const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp'];
  
  if (allowedTypes.includes(file.mimetype)) {
    cb(null, true);
  } else {
    cb(new Error('Only image files (JPEG, PNG, GIF, WebP) are allowed'), false);
  }
};

// Configure multer upload
const uploadLogo = multer({
  storage: logoStorage,
  fileFilter: imageFilter,
  limits: {
    fileSize: 5 * 1024 * 1024, // 5MB limit
    files: 1 // Only one file at a time
  }
});

// POST /api/uploads/logo - Upload a new logo
router.post('/logo', uploadLogo.single('logo'), async (req, res) => {
  try {
    console.log('[UPLOAD] Logo upload attempt started');
    
    if (!req.file) {
      console.log('[UPLOAD] No file provided in request');
      return res.status(400).json({
        success: false,
        message: 'No logo file provided'
      });
    }

    console.log('[UPLOAD] File received:', {
      originalName: req.file.originalname,
      filename: req.file.filename,
      size: req.file.size,
      mimetype: req.file.mimetype
    });

    // Return success response with file info
    res.status(200).json({
      success: true,
      message: 'Logo uploaded successfully',
      data: {
        filename: req.file.filename,
        originalName: req.file.originalname,
        size: req.file.size,
        mimetype: req.file.mimetype,
        path: `/images/logos/${req.file.filename}`
      }
    });

    console.log('[UPLOAD] Logo uploaded successfully:', req.file.filename);
    
  } catch (error) {
    console.error('[UPLOAD] Error uploading logo:', error);
    res.status(500).json({
      success: false,
      message: 'Error uploading logo',
      error: error.message
    });
  }
});

// GET /api/uploads/logos - List all uploaded logos
router.get('/logos', async (req, res) => {
  try {
    console.log('[UPLOAD] Fetching logo list');
    
    const logosPath = path.join(__dirname, '../images/logos');
    
    if (!fs.existsSync(logosPath)) {
      console.log('[UPLOAD] Logos directory does not exist');
      return res.status(200).json({
        success: true,
        data: []
      });
    }

    const files = fs.readdirSync(logosPath);
    const logoFiles = files.filter(file => {
      const ext = path.extname(file).toLowerCase();
      return ['.jpg', '.jpeg', '.png', '.gif', '.webp'].includes(ext);
    });

    const logosWithInfo = logoFiles.map(filename => {
      const filePath = path.join(logosPath, filename);
      const stats = fs.statSync(filePath);
      
      return {
        filename,
        path: `/images/logos/${filename}`,
        size: stats.size,
        createdAt: stats.birthtime,
        modifiedAt: stats.mtime
      };
    });

    // Sort by creation date, newest first
    logosWithInfo.sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));

    console.log('[UPLOAD] Found', logosWithInfo.length, 'logo files');
    
    res.status(200).json({
      success: true,
      data: logosWithInfo
    });
    
  } catch (error) {
    console.error('[UPLOAD] Error fetching logos:', error);
    res.status(500).json({
      success: false,
      message: 'Error fetching logos',
      error: error.message
    });
  }
});

// DELETE /api/uploads/logo/:filename - Delete a specific logo
router.delete('/logo/:filename', async (req, res) => {
  try {
    const { filename } = req.params;
    console.log('[UPLOAD] Delete logo request for:', filename);
    
    if (!filename) {
      return res.status(400).json({
        success: false,
        message: 'Filename is required'
      });
    }

    // Security check: ensure filename doesn't contain path traversal
    if (filename.includes('..') || filename.includes('/') || filename.includes('\\')) {
      console.log('[UPLOAD] Invalid filename detected:', filename);
      return res.status(400).json({
        success: false,
        message: 'Invalid filename'
      });
    }

    const filePath = path.join(__dirname, '../images/logos', filename);
    
    if (!fs.existsSync(filePath)) {
      console.log('[UPLOAD] File not found:', filePath);
      return res.status(404).json({
        success: false,
        message: 'Logo file not found'
      });
    }

    fs.unlinkSync(filePath);
    console.log('[UPLOAD] Logo deleted successfully:', filename);
    
    res.status(200).json({
      success: true,
      message: 'Logo deleted successfully'
    });
    
  } catch (error) {
    console.error('[UPLOAD] Error deleting logo:', error);
    res.status(500).json({
      success: false,
      message: 'Error deleting logo',
      error: error.message
    });
  }
});

// Error handling middleware for multer
router.use((error, req, res, next) => {
  if (error instanceof multer.MulterError) {
    console.error('[UPLOAD] Multer error:', error);
    
    if (error.code === 'LIMIT_FILE_SIZE') {
      return res.status(400).json({
        success: false,
        message: 'File too large. Maximum size is 5MB.'
      });
    }
    
    if (error.code === 'LIMIT_FILE_COUNT') {
      return res.status(400).json({
        success: false,
        message: 'Too many files. Only one file allowed.'
      });
    }
    
    return res.status(400).json({
      success: false,
      message: 'File upload error',
      error: error.message
    });
  }
  
  if (error.message === 'Only image files (JPEG, PNG, GIF, WebP) are allowed') {
    return res.status(400).json({
      success: false,
      message: error.message
    });
  }
  
  next(error);
});

module.exports = router;