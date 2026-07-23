const sequelize = require('../config/database');
const User = require('./User');
const Category = require('./Category');
const Product = require('./Product');
const ProductTranslation = require('./ProductTranslation');
const ProductImage = require('./ProductImage');
const GlazingType = require('./GlazingType');
const ProductGlazing = require('./ProductGlazing');
const Specification = require('./Specification');
const Draft = require('./Draft');
const Translation = require('./Translation');

// Define relationships
Category.hasMany(Product, { foreignKey: 'categoryId', as: 'products' });
Product.belongsTo(Category, { foreignKey: 'categoryId', as: 'category' });

Product.hasMany(ProductTranslation, { foreignKey: 'productId', as: 'translations' });
ProductTranslation.belongsTo(Product, { foreignKey: 'productId', as: 'product' });

Product.hasMany(ProductImage, { foreignKey: 'productId', as: 'images' });
ProductImage.belongsTo(Product, { foreignKey: 'productId', as: 'product' });

Product.belongsToMany(GlazingType, { 
  through: ProductGlazing, 
  foreignKey: 'productId',
  otherKey: 'glazingTypeId',
  as: 'glazings'
});
GlazingType.belongsToMany(Product, { 
  through: ProductGlazing, 
  foreignKey: 'glazingTypeId',
  otherKey: 'productId',
  as: 'products'
});


const models = {
  User,
  Category,
  Product,
  ProductTranslation,
  ProductImage,
  GlazingType,
  ProductGlazing,
  Specification,
  Draft,
  Translation
};

module.exports = {
  sequelize,
  ...models
};