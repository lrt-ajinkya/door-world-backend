const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Product = sequelize.define('Product', {
  id: {
    type: DataTypes.UUID,
    defaultValue: DataTypes.UUIDV4,
    primaryKey: true
  },
  firebaseId: {
    type: DataTypes.STRING,
    allowNull: true,
    comment: 'Original Firebase document ID for migration purposes'
  },
  categoryId: {
    type: DataTypes.UUID,
    allowNull: false,
    references: {
      model: 'categories',
      key: 'id'
    }
  },
  sku: {
    type: DataTypes.STRING,
    allowNull: true,
    unique: true
  },
  group: {
    type: DataTypes.STRING,
    allowNull: true,
    comment: 'Product group (hinge, opposite, lshape, etc.)'
  },
  side: {
    type: DataTypes.STRING,
    allowNull: true,
    comment: 'Product side (hinge, opposite, both)'
  },
  colors: {
    type: DataTypes.STRING,
    allowNull: true,
    comment: 'Available colors (PVC, RAL, WRB, none)'
  },
  basePrice: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true,
    defaultValue: 0
  },
  altPrice: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true,
    comment: 'Alternative price for different configurations'
  },
  customPrice: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    comment: 'Whether this product has custom pricing'
  },
  multiplier: {
    type: DataTypes.DECIMAL(5, 2),
    allowNull: true,
    defaultValue: 1.0
  },
  orderIndex: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0
  },
  isDefault: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  isDouble: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  fits: {
    type: DataTypes.JSONB,
    defaultValue: {},
    comment: 'What door types this product fits (classic, max, etc.)'
  },
  attributes: {
    type: DataTypes.JSONB,
    defaultValue: {},
    comment: 'Additional product attributes as key-value pairs'
  },
  isActive: {
    type: DataTypes.BOOLEAN,
    defaultValue: true
  }
}, {
  tableName: 'products',
  timestamps: true,
  indexes: [
    {
      fields: ['categoryId']
    },
    {
      fields: ['firebaseId']
    },
    {
      fields: ['group']
    },
    {
      fields: ['isActive']
    }
  ]
});

module.exports = Product;