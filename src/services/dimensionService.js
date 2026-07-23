const { Product, ProductTranslation } = require('../models');

class DimensionService {

  // This service provides dimension data that was previously in Firebase
  // It can be implemented as either:
  // 1. Hardcoded dimension data (for quick migration)
  // 2. Database-driven dimensions (for flexibility)
  
  // For now, providing hardcoded classic dimensions that can be easily migrated to DB later

  async getClassicDimensions(language = 'en') {
    // These would typically come from a database table
    // but for quick migration, providing the essential dimension data
    const dimensions = [
      {
        _id: "classic_std_2100_900",
        type: "classic",
        height: 2100,
        width: 900,
        name: {
          en: "Standard Classic 2100x900",
          lt: "Standartinis klasikinis 2100x900"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "classic_std_2100_800",
        type: "classic", 
        height: 2100,
        width: 800,
        name: {
          en: "Standard Classic 2100x800",
          lt: "Standartinis klasikinis 2100x800"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "classic_std_2000_900",
        type: "classic",
        height: 2000,
        width: 900,
        name: {
          en: "Standard Classic 2000x900", 
          lt: "Standartinis klasikinis 2000x900"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "classic_std_2000_800",
        type: "classic",
        height: 2000,
        width: 800, 
        name: {
          en: "Standard Classic 2000x800",
          lt: "Standartinis klasikinis 2000x800"
        },
        price: 0,
        isStandard: true
      }
    ];

    // Transform to include the requested language as the main name field
    return dimensions.map(dim => ({
      ...dim,
      name: dim.name[language] || dim.name.en
    }));
  }

  async getMaxDimensions(language = 'en') {
    const dimensions = [
      {
        _id: "max_std_2100_900",
        type: "max",
        height: 2100,
        width: 900,
        name: {
          en: "Standard Max 2100x900",
          lt: "Standartinis maks 2100x900"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "max_std_2100_800",
        type: "max",
        height: 2100,
        width: 800,
        name: {
          en: "Standard Max 2100x800",
          lt: "Standartinis maks 2100x800"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "max_std_2000_900",
        type: "max",
        height: 2000,
        width: 900,
        name: {
          en: "Standard Max 2000x900",
          lt: "Standartinis maks 2000x900"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "max_std_2000_800",
        type: "max",
        height: 2000,
        width: 800,
        name: {
          en: "Standard Max 2000x800",
          lt: "Standartinis maks 2000x800"
        },
        price: 0,
        isStandard: true
      },
      {
        _id: "max_custom",
        type: "max",
        height: null,
        width: null,
        name: {
          en: "Custom Max Dimensions",
          lt: "Individualūs maks matmenys"
        },
        price: 0,
        isCustom: true
      }
    ];

    return dimensions.map(dim => ({
      ...dim,
      name: dim.name[language] || dim.name.en
    }));
  }

  async getAllFinishings(language = 'en') {
    // Placeholder for finishing data - would typically come from products table
    // or a dedicated finishings table
    const finishings = [
      {
        _id: "finishing_laminate_white",
        type: "laminate",
        color: "white",
        name: {
          en: "White Laminate",
          lt: "Baltas laminātas"
        },
        price: 0
      },
      {
        _id: "finishing_laminate_oak",
        type: "laminate", 
        color: "oak",
        name: {
          en: "Oak Laminate",
          lt: "Ąžuolo laminātas"
        },
        price: 25
      },
      {
        _id: "finishing_paint_ral",
        type: "paint",
        color: "ral",
        name: {
          en: "RAL Paint",
          lt: "RAL dažymas"
        },
        price: 50
      }
    ];

    return finishings.map(finish => ({
      ...finish,
      name: finish.name[language] || finish.name.en
    }));
  }

  async getMillings(language = 'en') {
    const millings = [
      {
        _id: "milling_none",
        type: "none",
        name: {
          en: "No Milling",
          lt: "Be frezavimo"
        },
        price: 0
      },
      {
        _id: "milling_standard",
        type: "standard",
        name: {
          en: "Standard Milling",
          lt: "Standartinis frezavimas"
        },
        price: 30
      },
      {
        _id: "milling_decorative",
        type: "decorative",
        name: {
          en: "Decorative Milling",
          lt: "Dekoratyvinis frezavimas"
        },
        price: 75
      }
    ];

    return millings.map(milling => ({
      ...milling,
      name: milling.name[language] || milling.name.en
    }));
  }

  async getDoorTypePrices(language = 'en') {
    const doorTypePrices = [
      {
        _id: "door_classic_base",
        doorType: "classic",
        name: {
          en: "Classic Door Base Price",
          lt: "Klasikinių durų bazinė kaina"
        },
        basePrice: 450,
        pricePerSqm: 200
      },
      {
        _id: "door_max_base", 
        doorType: "max",
        name: {
          en: "Max Door Base Price",
          lt: "Maks durų bazinė kaina"
        },
        basePrice: 650,
        pricePerSqm: 280
      }
    ];

    return doorTypePrices.map(price => ({
      ...price,
      name: price.name[language] || price.name.en
    }));
  }

  // Future method: Create database-driven dimensions
  async createDimensionFromProduct(productId, dimensionType) {
    // This would create dimension entries based on product data
    // Useful for migrating from the current hardcoded approach
    // to a fully database-driven system
    
    // Implementation would:
    // 1. Get product details
    // 2. Create dimension record
    // 3. Link to product for pricing
    
    throw new Error('Database-driven dimensions not yet implemented');
  }
}

module.exports = new DimensionService();