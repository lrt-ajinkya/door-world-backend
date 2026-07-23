const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Specification = sequelize.define('Specification', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  access: {
    type: DataTypes.JSONB,
    defaultValue: [],
    comment: 'Array of strings with access permissions'
  },
  createdAt: {
    type: DataTypes.DATE(6),
    defaultValue: DataTypes.NOW,
    allowNull: false
  },
  createdBy: {
    type: DataTypes.TEXT,
    allowNull: false,
    comment: 'User who created this specification'
  },
  lastUpdated: {
    type: DataTypes.DATE(6),
    defaultValue: DataTypes.NOW,
    allowNull: false
  },
  name: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'Specification name/title'
  },
  specification: {
    type: DataTypes.JSONB,
    defaultValue: {},
    comment: 'Complete specification data as JSON'
  }
}, {
  tableName: 'specifications',
  timestamps: false, // We're managing timestamps manually
  indexes: [
    {
      fields: ['createdBy']
    },
    {
      fields: ['createdAt']
    },
    {
      fields: ['lastUpdated']
    },
    {
      fields: ['name']
    }
  ],
  hooks: {
    beforeUpdate: (specification) => {
      specification.lastUpdated = new Date();
    }
  }
});

module.exports = Specification;