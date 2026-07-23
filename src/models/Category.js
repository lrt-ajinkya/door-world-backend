const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Category = sequelize.define('Category', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  adjustable: {
    type: DataTypes.BOOLEAN,
    allowNull: true
  },
  collections: {
    type: DataTypes.STRING,
    allowNull: true
  },
  en: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'English name'
  },
  lt: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'Lithuanian name'
  },
  order: {
    type: DataTypes.INTEGER,
    allowNull: true,
    field: 'order'
  },
  slug: {
    type: DataTypes.STRING,
    allowNull: true,
    comment: 'URL-friendly identifier'
  }
}, {
  tableName: 'categories',
  timestamps: false,
  indexes: [
    {
      fields: ['order']
    },
    {
      fields: ['slug']
    }
  ]
});

module.exports = Category;