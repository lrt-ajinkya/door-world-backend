const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const ProductTranslation = sequelize.define('ProductTranslation', {
  id: {
    type: DataTypes.UUID,
    defaultValue: DataTypes.UUIDV4,
    primaryKey: true
  },
  productId: {
    type: DataTypes.UUID,
    allowNull: false,
    references: {
      model: 'products',
      key: 'id'
    }
  },
  languageCode: {
    type: DataTypes.STRING(5),
    allowNull: false,
    comment: 'Language code (en, lt, etc.)'
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  shortDescription: {
    type: DataTypes.STRING,
    allowNull: true
  }
}, {
  tableName: 'product_translations',
  timestamps: true,
  indexes: [
    {
      fields: ['productId', 'languageCode'],
      unique: true
    },
    {
      fields: ['languageCode']
    }
  ]
});

module.exports = ProductTranslation;