const pool = require('../config/pool');

class FinishingService {
  
  constructor() {
    this.logger = console;
  }

  /**
   * Get finishings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Finishing options
   */
  async getFinishings(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM finishings
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
   * Get millings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Milling options
   */
  async getMillings(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          ${nameColumn} as name,
          name as display_name,
          items
        FROM millings
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
   * Get milling images
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Milling images
   */
  async getMillingImages(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id,
          image
        FROM millingimages
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
   * Get door finishings and millings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Door finishing and milling combinations
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
   * Get finishing by ID
   * @param {string} id - Finishing ID
   * @param {string} language - Language code (en/lt)
   * @returns {Object} Finishing details
   */
  async getFinishingById(id, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          carvings,
          colors,
          "default",
          ${nameColumn} as name,
          name as display_name,
          millings,
          "order",
          price
        FROM finishings
        WHERE id = $1
      `, [id]);

      return result.rows.length > 0 ? result.rows[0] : null;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get milling by ID
   * @param {string} id - Milling ID
   * @param {string} language - Language code (en/lt)
   * @returns {Object} Milling details
   */
  async getMillingById(id, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          ${nameColumn} as name,
          name as display_name,
          items
        FROM millings
        WHERE id = $1
      `, [id]);

      return result.rows.length > 0 ? result.rows[0] : null;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get finishings by color compatibility
   * @param {string} colorType - Color type (ral_all, pvc, ral_and_stained)
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Compatible finishing options
   */
  async getFinishingsByColorType(colorType, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          carvings,
          colors,
          "default",
          ${nameColumn} as name,
          name as display_name,
          millings,
          "order",
          price
        FROM finishings
        WHERE colors = $1 OR colors IS NULL
        ORDER BY "order" ASC NULLS LAST, name ASC
      `, [colorType]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get finishings that support carvings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Finishing options that support carvings
   */
  async getFinishingsWithCarvings(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          carvings,
          colors,
          "default",
          ${nameColumn} as name,
          name as display_name,
          millings,
          "order",
          price
        FROM finishings
        WHERE carvings = true
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
   * Get carvings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Carving options
   */
  async getCarvings(language = 'en') {
    this.logger.log('[FinishingService] Getting carvings');
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT * 
        FROM carvings
        ORDER BY name ASC
      `);

      this.logger.log(`[FinishingService] Found ${result.rows.length} carvings`);
      return result.rows;
    } catch (error) {
      this.logger.error('[FinishingService] Error getting carvings:', error);
      throw error;
    } finally {
      client.release();
    }
  }
}

module.exports = new FinishingService();