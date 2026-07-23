const pool = require('../config/pool');

class DoorComponentsService {
  
  constructor() {
    this.logger = console;
  }
  
  /**
   * Get all door types with pricing
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Door types with pricing information
   */
  async getDoorTypes(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          ${nameColumn} as name,
          key,
          image,
          "order",
          price
        FROM doortypes
        ORDER BY "order" ASC NULLS LAST, key ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get door type prices
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Door type pricing information
   */
  async getDoorTypePrices(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          *
        FROM doortypeprices
        ORDER BY position ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get door models (classic, max, bulletproof)
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Door models information
   */
  async getDoorModels(language = 'en') {
    const client = await pool.connect();
    try {
      
      // Get door types and bulletproof models
      const doorTypesResult = await client.query(`
        SELECT 
          *
        FROM doormodels
        ORDER BY "order" ASC NULLS LAST
      `);

      return doorTypesResult.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get door colors by type (PVC, stained, standard metal)
   * @param {string} type - Color type (pvc, stained, standard_metal)
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Color options
   */
  async getDoorColors(type, language = 'en') {
    const client = await pool.connect();
    try {
      let query;
      let params = [];

      switch (type) {
        case 'pvc':
          query = `
            SELECT 
              id,
              name,
              image,
              "order",
              color_type,
              type
            FROM pvccolors
            ORDER BY "order" ASC NULLS LAST, name ASC
          `;
          break;
        
        case 'stained':
          query = `
            SELECT 
              id,
              name,
              image,
              null as "order",
              color_type,
              null as type
            FROM stainedcolors
            ORDER BY name ASC
          `;
          break;
        
        case 'standard_metal':
          query = `
            SELECT 
              id,
              name,
              null as image,
              "order",
              color_type,
              ral
            FROM standardmetalcolors
            ORDER BY "order" ASC NULLS LAST, name ASC
          `;
          break;
        
        default:
          throw new Error(`Unsupported color type: ${type}`);
      }

      const result = await client.query(query, params);
      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get dimensions by door model (classic/max)
   * @param {string} doorModel - Door model (classic/max)
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Dimension options with pricing
   */
  async getDimensions(doorModel, language = 'en') {
    const client = await pool.connect();
    try {
      let tableName;
      
      switch (doorModel.toLowerCase()) {
        case 'classic':
          tableName = 'dimensionsclassic';
          break;
        case 'max':
          tableName = 'dimensionsmax';
          break;
        default:
          throw new Error(`Unsupported door model: ${doorModel}`);
      }

      const result = await client.query(`
        SELECT 
          id,
          heights
        FROM ${tableName}
        ORDER BY id ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get exploitation conditions
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Exploitation conditions
   */
  async getExploitationConditions(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM exploitationconditions
        ORDER BY "default" DESC NULLS LAST, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get door openings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Door opening types
   */
  async getDoorOpenings(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id,
          key,
          name,
          image
        FROM dooropenings
        ORDER BY name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get door types actual
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Actual door type configurations
   */
  async getDoorTypesActual(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id,
          "default",
          description,
          "double",
          image,
          name,
          prices,
          wider
        FROM doortypesactual
        ORDER BY "default" DESC NULLS LAST, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get door finishings and millings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Door finishing and milling options
   */
  async getDoorFinishingsAndMillings(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id,
          carvings,
          colors,
          currency,
          "default",
          finishing,
          key,
          millings,
          name,
          "order",
          price
        FROM doorfinishingsandmillings
        ORDER BY "order" ASC NULLS LAST, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get bulletproof models
   * @returns {Array} Bulletproof model options
   */
  async getBulletproofModels() {
    this.logger.log('[DoorComponentsService] Getting bulletproof models');
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT * 
        FROM bulletproofmodel
        ORDER BY "order" ASC NULLS LAST, en ASC
      `);

      this.logger.log(`[DoorComponentsService] Found ${result.rows.length} bulletproof models`);
      return result.rows;
    } catch (error) {
      this.logger.error('[DoorComponentsService] Error getting bulletproof models:', error);
      throw error;
    } finally {
      client.release();
    }
  }
}

module.exports = new DoorComponentsService();