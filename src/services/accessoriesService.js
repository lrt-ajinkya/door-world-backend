const pool = require('../config/pool');

class AccessoriesService {

  /**
   * Get architraves
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Architrave options
   */
  async getArchitraves(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM architraves
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
   * Get architraves by group
   * @param {string} group - Architrave group (hinge, opposite, lshape)
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Architrave options for specific group
   */
  async getArchitravesByGroup(group, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          alt_price,
          colors,
          custom_price,
          "default",
          "double",
          ${nameColumn} as name,
          name as display_name,
          fits,
          "group",
          image,
          image_,
          multiplier,
          "order",
          price,
          side
        FROM architraves
        WHERE "group" = $1
        ORDER BY "order" ASC NULLS LAST, name ASC
      `, [group]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get thresholds
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Threshold options
   */
  async getThresholds(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          door_type,
          ${nameColumn} as name,
          name as display_name,
          "group",
          image,
          options,
          "order",
          price
        FROM thresholds
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
   * Get thresholds by group
   * @param {string} group - Threshold group (oak, ss)
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Threshold options for specific group
   */
  async getThresholdsByGroup(group, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          door_type,
          ${nameColumn} as name,
          name as display_name,
          "group",
          image,
          options,
          "order",
          price
        FROM thresholds
        WHERE "group" = $1
        ORDER BY "order" ASC NULLS LAST, name ASC
      `, [group]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get threshold options
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Threshold option configurations
   */
  async getThresholdOptions(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          *
        FROM thresholdoptions
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
   * Get other accessories
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Other accessory options
   */
  async getOtherAccessories(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          *
        FROM otheraccessories
        ORDER BY "group" ASC NULLS LAST, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get other accessories by group
   * @param {string} group - Accessory group
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Other accessory options for specific group
   */
  async getOtherAccessoriesByGroup(group, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          ${nameColumn} as name,
          name as display_name,
          "group",
          image,
          price,
          quantifiable,
          quantity,
          umbrella
        FROM otheraccessories
        WHERE "group" = $1
        ORDER BY name ASC
      `, [group]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get architrave by ID
   * @param {string} id - Architrave ID
   * @param {string} language - Language code (en/lt)
   * @returns {Object} Architrave details
   */
  async getArchitraveById(id, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          alt_price,
          colors,
          custom_price,
          "default",
          "double",
          ${nameColumn} as name,
          name as display_name,
          fits,
          "group",
          image,
          image_,
          multiplier,
          "order",
          price,
          side
        FROM architraves
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
   * Get threshold by ID
   * @param {string} id - Threshold ID
   * @param {string} language - Language code (en/lt)
   * @returns {Object} Threshold details
   */
  async getThresholdById(id, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          door_type,
          ${nameColumn} as name,
          name as display_name,
          "group",
          image,
          options,
          "order",
          price
        FROM thresholds
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
   * Get architraves compatible with door types
   * @param {Array} doorTypes - Array of door type keys
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Compatible architrave options
   */
  async getArchitravesByDoorTypes(doorTypes, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      // Build the query to check JSONB array containment
      const result = await client.query(`
        SELECT 
          id,
          alt_price,
          colors,
          custom_price,
          "default",
          "double",
          ${nameColumn} as name,
          name as display_name,
          fits,
          "group",
          image,
          image_,
          multiplier,
          "order",
          price,
          side
        FROM architraves
        WHERE fits ?| $1
        ORDER BY "order" ASC NULLS LAST, name ASC
      `, [doorTypes]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get thresholds compatible with door types
   * @param {Array} doorTypes - Array of door type keys
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Compatible threshold options
   */
  async getThresholdsByDoorTypes(doorTypes, language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          id,
          door_type,
          ${nameColumn} as name,
          name as display_name,
          "group",
          image,
          options,
          "order",
          price
        FROM thresholds
        WHERE door_type ?| $1 OR door_type IS NULL
        ORDER BY "order" ASC NULLS LAST, name ASC
      `, [doorTypes]);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }
}

module.exports = new AccessoriesService();