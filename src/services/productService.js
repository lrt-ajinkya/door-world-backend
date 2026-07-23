const pool = require('../config/pool');

class ProductService {
  
  constructor() {
    this.logger = console;
  }
  
  async getCategories() {
    this.logger.log('[ProductService] Getting categories');
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id, 
          adjustable,
          collections,
          en,
          lt,
          "order",
          slug
        FROM categories 
        ORDER BY "order" ASC
      `);
      this.logger.log(`[ProductService] Found ${result.rows.length} categories`);
      return result.rows;
    } catch (error) {
      this.logger.error('[ProductService] Error getting categories:', error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getProductsByCategory(categoryId) {
    this.logger.log(`[ProductService] Getting products for category: ${categoryId}`);
    const client = await pool.connect();
    try {
      // First, get the category and parse the collections JSON
      this.logger.log(`[ProductService] Querying category collections for: ${categoryId}`);
      const categoryResult = await client.query(`
        SELECT collections 
        FROM categories 
        WHERE id = $1
      `, [categoryId]);

      if (categoryResult.rows.length === 0) {
        this.logger.error(`[ProductService] Category not found: ${categoryId}`);
        throw new Error('Category not found');
      }

      const collections = categoryResult.rows[0].collections;
      this.logger.log(`[ProductService] Collections data:`, collections);
      
      if (!collections || !Array.isArray(collections) || collections.length === 0) {
        this.logger.warn(`[ProductService] No collections found for category: ${categoryId}`);
        throw new Error('No collections found for this category');
      }

      // Extract collections data with id and translation
      const results = [];
      this.logger.log(`[ProductService] Processing ${collections.length} collections`);

      // Query each table and structure results
      for (const collection of collections) {
        const tableName = collection.id;
        const translation = collection.translation;
        
        this.logger.log(`[ProductService] Querying table: ${tableName} (${translation})`);
        try {
          const result = await client.query(`
            SELECT *
            FROM ${tableName}
            ORDER BY "order" ASC NULLS LAST, en ASC
          `);
          
          this.logger.log(`[ProductService] Found ${result.rows.length} products in table: ${tableName}`);
          results.push({
            id: tableName,
            translation: translation,
            data: result.rows
          });
        } catch (tableError) {
          this.logger.warn(`[ProductService] Could not query table ${tableName}:`, tableError.message);
          // Continue with other tables even if one fails
          results.push({
            id: tableName,
            translation: translation,
            data: []
          });
        }
      }

      this.logger.log(`[ProductService] Returning ${results.length} collection groups`);
      return results;
    } catch (error) {
      this.logger.error(`[ProductService] Error getting products for category ${categoryId}:`, error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getProduct(productId, language = 'en') {
    this.logger.log(`[ProductService] Getting product: ${productId} (language: ${language})`);
    const client = await pool.connect();
    try {
      // Try to find the product in different tables
      const tables = ['architraves', 'handles', 'glass', 'mainlocks', 'hinges', 
                     'finishings', 'pvccolors', 'thresholds', 'doortypes'];
      
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      this.logger.log(`[ProductService] Searching in ${tables.length} tables for product: ${productId}`);
      
      for (const tableName of tables) {
        this.logger.log(`[ProductService] Checking table: ${tableName}`);
        const result = await client.query(`
          SELECT 
            id,
            ${nameColumn} as name,
            name as display_name,
            price,
            image,
            "group",
            "order"
          FROM ${tableName}
          WHERE id = $1
        `, [productId]);
        
        if (result.rows.length > 0) {
          this.logger.log(`[ProductService] Found product in table: ${tableName}`);
          return { ...result.rows[0], table: tableName };
        }
      }
      
      this.logger.warn(`[ProductService] Product not found: ${productId}`);
      return null;
    } catch (error) {
      this.logger.error(`[ProductService] Error getting product ${productId}:`, error);
      throw error;
    } finally {
      client.release();
    }
  }

  async searchProducts(searchTerm, language = 'en', category = null) {
    this.logger.log(`[ProductService] Searching products: '${searchTerm}' (language: ${language}, category: ${category})`);
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      const searchPattern = `%${searchTerm.toLowerCase()}%`;
      
      // Search across multiple tables
      const tables = category ? [category] : ['architraves', 'handles', 'glass', 'mainlocks'];
      this.logger.log(`[ProductService] Searching in tables:`, tables);
      const results = [];
      
      for (const tableName of tables) {
        this.logger.log(`[ProductService] Searching in table: ${tableName}`);
        const result = await client.query(`
          SELECT 
            id,
            ${nameColumn} as name,
            name as display_name,
            price,
            image,
            "group",
            '${tableName}' as table_name
          FROM ${tableName}
          WHERE LOWER(${nameColumn}) LIKE $1 OR LOWER(name) LIKE $1
          ORDER BY name ASC
          LIMIT 20
        `, [searchPattern]);
        
        this.logger.log(`[ProductService] Found ${result.rows.length} matches in ${tableName}`);
        results.push(...result.rows);
      }
      
      this.logger.log(`[ProductService] Search completed. Total results: ${results.length}`);
      return results;
    } catch (error) {
      this.logger.error(`[ProductService] Error searching products for '${searchTerm}':`, error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getProductsByGroup(group, language = 'en') {
    this.logger.log(`[ProductService] Getting products by group: ${group} (language: ${language})`);
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      // Search in tables that have a group column
      this.logger.log(`[ProductService] Querying architraves and handles tables for group: ${group}`);
      const result = await client.query(`
        SELECT 
          id,
          ${nameColumn} as name,
          name as display_name,
          price,
          image,
          "group",
          "order"
        FROM architraves
        WHERE "group" = $1
        UNION
        SELECT 
          id,
          ${nameColumn} as name,
          name as display_name,
          price,
          image,
          "group",
          "order"
        FROM handles
        WHERE "group" = $1
        ORDER BY "order" ASC NULLS LAST, name ASC
      `, [group]);

      this.logger.log(`[ProductService] Found ${result.rows.length} products for group: ${group}`);
      return result.rows;
    } catch (error) {
      this.logger.error(`[ProductService] Error getting products by group ${group}:`, error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getGlazingTypes() {
    this.logger.log('[ProductService] Getting glazing types');
    const client = await pool.connect();
    try {
      // Get unique glazing codes from carvings
      const result = await client.query(`
        SELECT DISTINCT 
          jsonb_array_elements_text(glazings) as code
        FROM carvings
        WHERE glazings IS NOT NULL
        ORDER BY code
      `);

      this.logger.log(`[ProductService] Found ${result.rows.length} glazing types`);
      return result.rows;
    } catch (error) {
      this.logger.error('[ProductService] Error getting glazing types:', error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getProductsWithGlazing(glazingCode, language = 'en') {
    this.logger.log(`[ProductService] Getting products with glazing: ${glazingCode} (language: ${language})`);
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id,
          name,
          image,
          glazings
        FROM carvings
        WHERE glazings ? $1
        ORDER BY name ASC
      `, [glazingCode]);

      this.logger.log(`[ProductService] Found ${result.rows.length} products with glazing: ${glazingCode}`);
      return result.rows;
    } catch (error) {
      this.logger.error(`[ProductService] Error getting products with glazing ${glazingCode}:`, error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getBulletproofModels() {
    this.logger.log('[ProductService] Getting bulletproof models');
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT * 
        FROM bulletproofmodels
        ORDER BY "order" ASC NULLS LAST, en ASC
      `);

      this.logger.log(`[ProductService] Found ${result.rows.length} bulletproof models`);
      return result.rows;
    } catch (error) {
      this.logger.error('[ProductService] Error getting bulletproof models:', error);
      throw error;
    } finally {
      client.release();
    }
  }

  async getDoorModels() {
    this.logger.log('[ProductService] Getting door models');
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT * 
        FROM doormodels
        ORDER BY "order" ASC NULLS LAST, en ASC
      `);

      this.logger.log(`[ProductService] Found ${result.rows.length} door models`);
      return result.rows;
    } catch (error) {
      this.logger.error('[ProductService] Error getting door models:', error);
      throw error;
    } finally {
      client.release();
    }
  }

  // Placeholder methods for create/update/delete - would need proper implementation
  async createProduct(productData, translations = [], images = [], glazings = []) {
    this.logger.warn('[ProductService] createProduct called - not implemented');
    throw new Error('Create product not implemented for direct PostgreSQL tables');
  }

  async updateProduct(productId, productData, translations, images, glazings) {
    this.logger.warn(`[ProductService] updateProduct called for ${productId} - not implemented`);
    throw new Error('Update product not implemented for direct PostgreSQL tables');
  }

  async deleteProduct(productId) {
    this.logger.warn(`[ProductService] deleteProduct called for ${productId} - not implemented`);
    throw new Error('Delete product not implemented for direct PostgreSQL tables');
  }
}

module.exports = new ProductService();