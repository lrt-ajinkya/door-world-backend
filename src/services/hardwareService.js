const pool = require('../config/pool');

class HardwareService {

  /**
   * Get hinges with options
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Hinge options
   */
  async getHinges(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          id,
          "default",
          name,
          price,
          quantity
        FROM hinges
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
   * Get hinge accessories
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Hinge accessories
   */
  async getHingeAccessories(language = 'en') {
    const client = await pool.connect();
    try {
      const result = await client.query(`
        SELECT 
          *
        FROM hingeaccessories
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
   * Get hinge caps
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Hinge caps
   */
  async getHingeCaps(language = 'en') {
    const client = await pool.connect();
    try {
      
      const result = await client.query(`
        SELECT 
          *
        FROM hingecaps
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
   * Get hinge cap finishings
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Hinge cap finishings
   */
  async getHingeCapFinishings(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM hingecapfinishings
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
   * Get handles by type
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Handle options
   */
  async getHandles(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM handles
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
   * Get main locks
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Main lock options
   */
  async getMainLocks(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM mainlocks
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
   * Get extra locks
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Extra lock options
   */
  async getExtraLocks(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM extralocks
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
   * Get locks easy
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Easy lock options
   */
  async getLocksEasy(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
         *
        FROM lockseasy
        ORDER BY collection ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get locks smart
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Smart lock options
   */
  async getLocksSmart(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM lockssmart
        ORDER BY collection ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get main lock accessories
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Main lock accessories
   */
  async getMainLockAccessories(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM mainlocksadditionalaccessories
        ORDER BY collection ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get locks easy accessories
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Easy lock accessories
   */
  async getLocksEasyAccessories(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM lockseasyaccessories
        ORDER BY collection ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get locks smart accessories
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Smart lock accessories
   */
  async getLocksSmartAccessories(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
        *
        FROM lockssmartaccessories
        ORDER BY collection ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get cylinders
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Cylinder options
   */
  async getCylinders(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
         *
        FROM cylinders
        ORDER BY make ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get extra cylinders
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Extra cylinder options
   */
  async getExtraCylinders(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM extracylinders
        ORDER BY make ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }

  /**
   * Get electric strikes
   * @param {string} language - Language code (en/lt)
   * @returns {Array} Electric strike options
   */
  async getElectricStrikes(language = 'en') {
    const client = await pool.connect();
    try {
      const nameColumn = language === 'lt' ? 'lt' : 'en';
      
      const result = await client.query(`
        SELECT 
          *
        FROM electricstrikes
        ORDER BY maker ASC, name ASC
      `);

      return result.rows;
    } catch (error) {
      throw error;
    } finally {
      client.release();
    }
  }
}

module.exports = new HardwareService();