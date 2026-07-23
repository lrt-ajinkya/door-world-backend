const pool = require('../config/pool');

class GlassService {

  /**
   * Get glass types
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Glass type options
   */
  async getGlassTypes(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          *
        FROM glasstype
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
   * Get glass type new
   * @param {string} language - Language code (en/lt)
   * @returns {Array} New glass type options
   */
  async getGlassTypeNew(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glasstypenew
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
   * Get glass new
   * @param {string} language - Language code (en/lt)
   * @returns {Array} New glass options
   */
  async getGlassNew(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glassnew
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
   * Get main glass options
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Main glass options with pricing
   */
  async getGlass(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glass
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
   * Get glass addon types
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Glass addon type options
   */
  async getGlassAddonTypes(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glassaddontypes
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
   * Get glass addon
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Glass addon options
   */
  async getGlassAddon(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glassaddon
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
   * Get glass film
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Glass film options
   */
  async getGlassFilm(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
         *
        FROM glassfilm
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
   * Get glass bulletproof sizes
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Bulletproof glass size options
   */
  async getGlassBulletProofSizes(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glassbulletproofsizes
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
   * Get glass shape bulletproof
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Bulletproof glass shape options
   */
  async getGlassShapeBulletproof(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          *
        FROM glassshapebulletproof
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
   * Get glass by ID
   * @param {string} id - Glass ID
   * @param {string} language - Language code (en/lt)
   * @returns {Object} Glass details
   */
  async getGlassById(id, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glass
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
   * Get default glass option
   * @param {string} language - Language code (en/lt)
   * @returns {Object} Default glass option
   */
  async getDefaultGlass(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM glass
        WHERE "default" = true
        LIMIT 1
      `);

      return result.rows.length > 0 ? result.rows[0] : null;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get all glass categories
   * @param {string} language - Language code (en/lt)
   * @returns {Object} All glass-related options grouped by type
   */
  async getAllGlassOptions(language = 'en') {
    const client = await pool.connect();
    try {
      const results = await Promise.all([
        this.getGlass(language),
        this.getGlassNew(language),
        this.getGlassTypeNew(language),
        this.getGlassAddonTypes(language),
        this.getGlassAddon(language),
        this.getGlassFilm(language),
        this.getGlassBulletProofSizes(language),
        this.getGlassShapeBulletproof(language)
      ]);

      return {
        glass: results[0],
        glassNew: results[1],
        glassTypeNew: results[2],
        glassAddonTypes: results[3],
        glassAddon: results[4],
        glassFilm: results[5],
        glassBulletProofSizes: results[6],
        glassShapeBulletproof: results[7]
      };
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Search glass options by name
   * @param {string} searchTerm - Search term
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Matching glass options
   */
  async searchGlass(searchTerm, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      const searchPattern = `%${searchTerm.toLowerCase()}%`;

      // Search across multiple glass tables
      const result = await client.query(`
        SELECT id, ${nameColumn} as name, 'glass' as type FROM glass 
        WHERE LOWER(${nameColumn}) LIKE $1 OR LOWER(name) LIKE $1
        UNION
        SELECT id, ${nameColumn} as name, 'glassnew' as type FROM glassnew 
        WHERE LOWER(${nameColumn}) LIKE $1 OR LOWER(name) LIKE $1
        UNION
        SELECT id, ${nameColumn} as name, 'glasstypenew' as type FROM glasstypenew 
        WHERE LOWER(${nameColumn}) LIKE $1 OR LOWER(name) LIKE $1
        ORDER BY name ASC
        LIMIT 50
      `, [searchPattern]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }
}

module.exports = new GlassService();