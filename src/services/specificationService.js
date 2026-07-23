const { Specification } = require('../models');
const { Op } = require('sequelize');

class SpecificationService {
  
  constructor() {
    this.logger = console;
  }

  async getSpecifications(userEmail = null, userId = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Getting specifications for user: ${userEmail}, admin: ${isAdmin}`);
    
    try {
      const whereClause = {};

      // If not admin, filter by user access
      if (!isAdmin && userEmail) {
        whereClause[Op.or] = [
          { createdBy: userEmail },
          { access: { [Op.contains]: [userEmail] } }
        ];
      }

      const specifications = await Specification.findAll({
        where: whereClause,
        order: [['createdAt', 'DESC']]
      });

      this.logger.log(`[SpecificationService] Found ${specifications.length} specifications`);
      return specifications;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error getting specifications for user ${userEmail}:`, error);
      throw error;
    }
  }

  async getSpecification(specId, userEmail = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Getting specification ${specId} for user: ${userEmail}`);
    
    try {
      const specification = await Specification.findByPk(specId);

      if (!specification) {
        this.logger.error(`[SpecificationService] Specification not found: ${specId}`);
        throw new Error('Specification not found');
      }

      // Check access permissions
      if (!isAdmin && userEmail) {
        const hasAccess = specification.createdBy === userEmail || 
                         (specification.access && specification.access.includes(userEmail));
        
        if (!hasAccess) {
          this.logger.warn(`[SpecificationService] Access denied to specification ${specId} for user: ${userEmail}`);
          throw new Error('Access denied to this specification');
        }
      }

      this.logger.log(`[SpecificationService] Successfully retrieved specification ${specId}`);
      return specification;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error getting specification ${specId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async createSpecification(specData, userId, userEmail) {
    this.logger.log(`[SpecificationService] Creating specification for user: ${userEmail}`);
    this.logger.log(`[SpecificationService] Raw specData received:`, JSON.stringify(specData, null, 2));
    
    try {
      // Ensure user has access to their own specification
      const access = specData.access || [];
      if (!access.includes(userEmail)) {
        access.push(userEmail);
      }

      const createData = {
        name: specData.name,
        specification: specData || {},
        createdBy: userEmail,
        access
      };

      this.logger.log(`[SpecificationService] Creating specification with data:`, JSON.stringify(createData, null, 2));
      
      const specification = await Specification.create(createData);

      this.logger.log(`[SpecificationService] Successfully created specification ${specification.id}`);
      this.logger.log(`[SpecificationService] Created specification content:`, JSON.stringify(specification.toJSON(), null, 2));
      return specification;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error creating specification for user ${userEmail}:`, error);
      throw error;
    }
  }

  async updateSpecification(specId, specData, userEmail = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Updating specification ${specId} for user: ${userEmail}`);
    
    try {
      const specification = await this.getSpecification(specId, userEmail, isAdmin);
      
      const updateData = {};
      if (specData.name !== undefined) updateData.name = specData.name;
      if (specData.specification !== undefined) updateData.specification = specData.specification;
      if (specData.access !== undefined) updateData.access = specData.access;
      
      // Don't allow changing createdBy
      delete updateData.createdBy;
      
      this.logger.log(`[SpecificationService] Updating specification ${specId} with fields:`, Object.keys(updateData));
      
      await specification.update(updateData);

      this.logger.log(`[SpecificationService] Successfully updated specification ${specId}`);
      return specification;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error updating specification ${specId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async deleteSpecification(specId, userEmail = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Deleting specification ${specId} for user: ${userEmail}`);
    
    try {
      const specification = await this.getSpecification(specId, userEmail, isAdmin);
      
      // Hard delete since we simplified the schema
      await specification.destroy();
      
      this.logger.log(`[SpecificationService] Successfully deleted specification ${specId}`);
      return { success: true, message: 'Specification deleted successfully' };
    } catch (error) {
      this.logger.error(`[SpecificationService] Error deleting specification ${specId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async copySpecification(specId, userEmail, userId, newName = null) {
    this.logger.log(`[SpecificationService] Copying specification ${specId} for user: ${userEmail}`);
    
    try {
      const originalSpec = await this.getSpecification(specId, userEmail);
      
      const specData = {
        name: newName || `Copy of ${originalSpec.name || 'Specification'}`,
        specification: originalSpec.specification,
        access: [userEmail] // Reset access to just the current user
      };

      this.logger.log(`[SpecificationService] Creating copy with name: ${specData.name}`);
      
      const newSpec = await this.createSpecification(specData, userId, userEmail);
      this.logger.log(`[SpecificationService] Successfully copied specification ${specId} to ${newSpec.id}`);
      return newSpec;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error copying specification ${specId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async shareSpecification(specId, emailsToAdd, userEmail = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Sharing specification ${specId} with users: ${emailsToAdd.join(', ')}`);
    
    try {
      const specification = await this.getSpecification(specId, userEmail, isAdmin);
      
      // Check if user has permission to share (owner or admin)
      if (!isAdmin && specification.createdBy !== userEmail) {
        this.logger.warn(`[SpecificationService] User ${userEmail} attempted to share specification ${specId} without permission`);
        throw new Error('Only the owner can share this specification');
      }

      const currentAccess = specification.access || [];
      const newAccess = [...new Set([...currentAccess, ...emailsToAdd])];
      
      this.logger.log(`[SpecificationService] Updating access list from ${currentAccess.length} to ${newAccess.length} users`);
      
      await specification.update({ access: newAccess });
      
      this.logger.log(`[SpecificationService] Successfully shared specification ${specId}`);
      return specification;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error sharing specification ${specId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async removeAccess(specId, emailsToRemove, userEmail = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Removing access from specification ${specId} for users: ${emailsToRemove.join(', ')}`);
    
    try {
      const specification = await this.getSpecification(specId, userEmail, isAdmin);
      
      // Check if user has permission to modify access (owner or admin)
      if (!isAdmin && specification.createdBy !== userEmail) {
        this.logger.warn(`[SpecificationService] User ${userEmail} attempted to modify access for specification ${specId} without permission`);
        throw new Error('Only the owner can modify access to this specification');
      }

      const currentAccess = specification.access || [];
      const newAccess = currentAccess.filter(email => !emailsToRemove.includes(email));
      
      // Ensure owner always has access
      if (!newAccess.includes(specification.createdBy)) {
        newAccess.push(specification.createdBy);
        this.logger.log(`[SpecificationService] Ensured owner ${specification.createdBy} maintains access`);
      }
      
      this.logger.log(`[SpecificationService] Updating access list from ${currentAccess.length} to ${newAccess.length} users`);
      
      await specification.update({ access: newAccess });
      
      this.logger.log(`[SpecificationService] Successfully removed access from specification ${specId}`);
      return specification;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error removing access from specification ${specId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async getSpecificationsByUser(userId) {
    // For backwards compatibility, treat userId as userEmail since we don't have userId anymore
    const userEmail = userId;
    this.logger.log(`[SpecificationService] Getting specifications for user: ${userEmail}`);
    
    try {
      const specifications = await Specification.findAll({
        where: {
          [Op.or]: [
            { createdBy: userEmail },
            { access: { [Op.contains]: [userEmail] } }
          ]
        },
        order: [['createdAt', 'DESC']]
      });

      this.logger.log(`[SpecificationService] Found ${specifications.length} specifications for user: ${userEmail}`);
      return specifications;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error getting specifications for user ${userEmail}:`, error);
      throw error;
    }
  }

  async getSpecificationsByUserEmail(userEmail) {
    this.logger.log(`[SpecificationService] Getting specifications for user email: ${userEmail}`);
    
    try {
      const specifications = await Specification.findAll({
        where: {
          access: { [Op.contains]: [userEmail] }
        },
        order: [['createdAt', 'DESC']]
      });

      this.logger.log(`[SpecificationService] Found ${specifications.length} specifications with access for user: ${userEmail}`);
      return specifications;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error getting specifications for user email ${userEmail}:`, error);
      throw error;
    }
  }

  async searchSpecifications(searchTerm, userEmail = null, userId = null, isAdmin = false) {
    this.logger.log(`[SpecificationService] Searching specifications for term: '${searchTerm}', user: ${userEmail}, admin: ${isAdmin}`);
    
    try {
      const whereClause = {
        [Op.and]: [
          {
            [Op.or]: [
              { name: { [Op.iLike]: `%${searchTerm}%` } }
            ]
          }
        ]
      };

      // Apply access restrictions if not admin
      if (!isAdmin && userEmail) {
        whereClause[Op.and].push({
          [Op.or]: [
            { createdBy: userEmail },
            { access: { [Op.contains]: [userEmail] } }
          ]
        });
        this.logger.log(`[SpecificationService] Applied access restrictions for user: ${userEmail}`);
      }

      const specifications = await Specification.findAll({
        where: whereClause,
        order: [['createdAt', 'DESC']]
      });

      this.logger.log(`[SpecificationService] Found ${specifications.length} specifications matching search term: '${searchTerm}'`);
      return specifications;
    } catch (error) {
      this.logger.error(`[SpecificationService] Error searching specifications for term '${searchTerm}' and user ${userEmail}:`, error);
      throw error;
    }
  }

  async getSpecificationStats(userId = null, isAdmin = false) {
    // For backwards compatibility, treat userId as userEmail since we don't have userId anymore
    const userEmail = userId;
    this.logger.log(`[SpecificationService] Getting specification stats for user: ${userEmail}, admin: ${isAdmin}`);
    
    try {
      const whereClause = {};
      
      if (!isAdmin && userEmail) {
        whereClause[Op.or] = [
          { createdBy: userEmail },
          { access: { [Op.contains]: [userEmail] } }
        ];
        this.logger.log(`[SpecificationService] Applied access restrictions for stats`);
      }

      const totalCount = await Specification.count({ where: whereClause });
      
      this.logger.log(`[SpecificationService] Successfully retrieved stats - Total specifications: ${totalCount}`);
      return {
        total: totalCount
      };
    } catch (error) {
      this.logger.error(`[SpecificationService] Error getting specification stats for user ${userEmail}:`, error);
      throw error;
    }
  }
}

module.exports = new SpecificationService();