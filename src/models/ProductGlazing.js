const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const ProductGlazing = sequelize.define('ProductGlazing', {
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
  glazingTypeId: {
    type: DataTypes.UUID,
    allowNull: false,
    references: {
      model: 'glazing_types',
      key: 'id'
    }
  }
}, {
  tableName: 'product_glazings',
  timestamps: true,
  indexes: [
    {
      fields: ['productId', 'glazingTypeId'],
      unique: true
    },
    {
      fields: ['productId']
    },
    {
      fields: ['glazingTypeId']
    }
  ]
});

module.exports = ProductGlazing;