const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Translation = sequelize.define('Translation', {
  id: {
    type: DataTypes.STRING,
    primaryKey: true,
    allowNull: false
  },
  
  // Language translations
  en: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'English translation'
  },
  lt: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'Lithuanian translation'
  }
}, {
  tableName: 'translations',
  timestamps: false,
  indexes: [
    {
      fields: ['id'],
      unique: true
    }
  ]
});

module.exports = Translation;