const { Translation } = require('../models');
const { Op } = require('sequelize');

class TranslationService {

  async getTranslations(language = 'en', category = null) {
    const translations = await Translation.findAll({
      order: [['id', 'ASC']]
    });

    // Return as key-value pairs for the requested language
    const result = {};
    translations.forEach(translation => {
      result[translation.id] = translation[language] || translation.en || '';
    });

    return result;
  }

  async getAllTranslations() {
    return await Translation.findAll({
      order: [['id', 'ASC']]
    });
  }

  async getTranslation(id) {
    const translation = await Translation.findByPk(id);

    if (!translation) {
      throw new Error('Translation not found');
    }

    return translation;
  }

  async createTranslation(translationData) {
    const translation = await Translation.create(translationData);
    return translation;
  }

  async updateTranslation(id, translationData) {
    const translation = await this.getTranslation(id);
    
    await translation.update(translationData);
    return translation;
  }

  async deleteTranslation(id) {
    const translation = await this.getTranslation(id);
    await translation.destroy();
    
    return { success: true, message: 'Translation deleted successfully' };
  }

  async getTranslationsByCategory(category, language = 'en') {
    // Since we don't have category field anymore, return all translations
    return await this.getTranslations(language);
  }

  async searchTranslations(searchTerm, language = 'en') {
    const translations = await Translation.findAll({
      where: {
        [Op.or]: [
          { en: { [Op.iLike]: `%${searchTerm}%` } },
          { lt: { [Op.iLike]: `%${searchTerm}%` } }
        ]
      },
      order: [['id', 'ASC']]
    });

    return translations;
  }

  async getCategories() {
    // No categories in simplified structure
    return [];
  }

  async bulkCreateTranslations(translationsArray) {
    const results = [];
    const errors = [];

    for (const translationData of translationsArray) {
      try {
        const translation = await this.createTranslation(translationData);
        results.push(translation);
      } catch (error) {
        errors.push({
          id: translationData.id,
          error: error.message
        });
      }
    }

    return { created: results, errors };
  }

  async bulkUpdateTranslations(translationsArray) {
    const results = [];
    const errors = [];

    for (const translationData of translationsArray) {
      try {
        const translation = await this.updateTranslation(translationData.id, translationData);
        results.push(translation);
      } catch (error) {
        errors.push({
          id: translationData.id,
          error: error.message
        });
      }
    }

    return { updated: results, errors };
  }

  async exportTranslations(language = null, category = null) {
    const translations = await Translation.findAll({
      order: [['id', 'ASC']]
    });

    if (language) {
      // Export for specific language
      const result = {};
      translations.forEach(translation => {
        result[translation.id] = translation[language] || '';
      });
      return result;
    } else {
      // Export all languages
      return translations.map(translation => ({
        id: translation.id,
        en: translation.en,
        lt: translation.lt
      }));
    }
  }

  async importTranslations(translationsData, overwrite = false) {
    const results = [];
    const errors = [];

    for (const translationData of translationsData) {
      try {
        // Check if translation exists
        const existing = await Translation.findByPk(translationData.id);

        if (existing && !overwrite) {
          errors.push({
            id: translationData.id,
            error: 'Translation already exists (use overwrite=true to update)'
          });
          continue;
        }

        if (existing && overwrite) {
          const updated = await this.updateTranslation(translationData.id, translationData);
          results.push({ action: 'updated', translation: updated });
        } else {
          const created = await this.createTranslation(translationData);
          results.push({ action: 'created', translation: created });
        }
      } catch (error) {
        errors.push({
          id: translationData.id,
          error: error.message
        });
      }
    }

    return { results, errors };
  }

  async getTranslationStats() {
    const totalCount = await Translation.count();
    
    const languageStats = await Translation.findAll({
      attributes: [
        [Translation.sequelize.fn('COUNT', Translation.sequelize.col('id')), 'total'],
        [Translation.sequelize.fn('COUNT', Translation.sequelize.col('en')), 'englishCount'],
        [Translation.sequelize.fn('COUNT', Translation.sequelize.col('lt')), 'lithuanianCount']
      ]
    });

    return {
      total: totalCount,
      categorized: 0,
      uncategorized: totalCount,
      languages: languageStats[0] || { total: 0, englishCount: 0, lithuanianCount: 0 }
    };
  }
}

module.exports = new TranslationService();