const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Draft = sequelize.define('Draft', {
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
    comment: 'User who created this draft'
  },
  lastSaved: {
    type: DataTypes.DATE(6),
    defaultValue: DataTypes.NOW,
    allowNull: false
  },
  name: {
    type: DataTypes.TEXT,
    allowNull: true,
    comment: 'Draft name/title'
  },
  draft: {
    type: DataTypes.JSONB,
    defaultValue: {},
    comment: 'Complete draft data as JSON'
  },
  autoSave: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
    comment: 'Whether this was saved automatically'
  },
  isActive: {
    type: DataTypes.BOOLEAN,
    defaultValue: true,
    comment: 'Whether this draft is active (for soft delete)'
  }
}, {
  tableName: 'drafts',
  timestamps: false, // We're managing timestamps manually
  indexes: [
    {
      fields: ['createdBy']
    },
    {
      fields: ['createdAt']
    },
    {
      fields: ['lastSaved']
    },
    {
      fields: ['name']
    },
    {
      fields: ['isActive']
    }
  ],
  hooks: {
    beforeUpdate: (draft) => {
      draft.lastSaved = new Date();
    }
  }
});

module.exports = Draft;