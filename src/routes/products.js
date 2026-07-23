const express = require('express');
const router = express.Router();
const productService = require('../services/productService');

// Get all categories
router.get('/categories', async (req, res) => {
  try {
    const categories = await productService.getCategories();
    res.json(categories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get products by category
router.get('/categories/:categorySlug/products', async (req, res) => {
  try {
    const { categorySlug } = req.params;
    const { language = 'en' } = req.query;
    
    const products = await productService.getProductsByCategory(categorySlug, language);
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get single product
router.get('/:productId', async (req, res) => {
  try {
    const { productId } = req.params;
    const { language = 'en' } = req.query;
    
    const product = await productService.getProduct(productId, language);
    if (!product) {
      return res.status(404).json({ error: 'Product not found' });
    }
    
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Search products
router.get('/search/:searchTerm', async (req, res) => {
  try {
    const { searchTerm } = req.params;
    const { language = 'en', category } = req.query;
    
    const products = await productService.searchProducts(searchTerm, language, category);
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get products by group
router.get('/groups/:group', async (req, res) => {
  try {
    const { group } = req.params;
    const { language = 'en' } = req.query;
    
    const products = await productService.getProductsByGroup(group, language);
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get all glazing types
router.get('/glazings/types', async (req, res) => {
  try {
    const glazingTypes = await productService.getGlazingTypes();
    res.json(glazingTypes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get products with specific glazing
router.get('/glazings/:glazingCode/products', async (req, res) => {
  try {
    const { glazingCode } = req.params;
    const { language = 'en' } = req.query;
    
    const products = await productService.getProductsWithGlazing(glazingCode, language);
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get bulletproof models
router.get('/bulletproof-models', async (req, res) => {
  try {
    const bulletproofModels = await productService.getBulletproofModels();
    res.json(bulletproofModels);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get door models
router.get('/door-models', async (req, res) => {
  try {
    const doorModels = await productService.getDoorModels();
    res.json(doorModels);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create new product (protected route - would normally require authentication)
router.post('/', async (req, res) => {
  try {
    const { productData, translations, images, glazings } = req.body;
    
    const product = await productService.createProduct(
      productData, 
      translations || [], 
      images || [], 
      glazings || []
    );
    
    res.status(201).json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update product (protected route - would normally require authentication)
router.put('/:productId', async (req, res) => {
  try {
    const { productId } = req.params;
    const { productData, translations, images, glazings } = req.body;
    
    const product = await productService.updateProduct(
      productId, 
      productData, 
      translations, 
      images, 
      glazings
    );
    
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Delete (deactivate) product (protected route - would normally require authentication)
router.delete('/:productId', async (req, res) => {
  try {
    const { productId } = req.params;
    
    const result = await productService.deleteProduct(productId);
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;