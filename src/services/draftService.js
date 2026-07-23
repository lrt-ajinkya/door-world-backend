const { Draft } = require('../models');
const { Op } = require('sequelize');

class DraftService {
  
  constructor() {
    this.logger = console;
  }

  async getDraftsByUserEmail(userEmail) {
    this.logger.log(`[DraftService] Getting drafts for user email: ${userEmail}`);
    
    try {
      const drafts = await Draft.findAll({
        where: {
          access: { [Op.contains]: [userEmail] },
          isActive: true
        },
        order: [['lastSaved', 'DESC']]
      });

      this.logger.log(`[DraftService] Found ${drafts.length} drafts with access for user: ${userEmail}`);
      return drafts;
    } catch (error) {
      this.logger.error(`[DraftService] Error getting drafts for user email ${userEmail}:`, error);
      throw error;
    }
  }

  async getDraft(draftId, userEmail = null, isAdmin = false) {
    this.logger.log(`[DraftService] Getting draft ${draftId} for user: ${userEmail}`);
    
    try {
      const draft = await Draft.findOne({
        where: {
          id: draftId,
          isActive: true
        }
      });

      if (!draft) {
        this.logger.error(`[DraftService] Draft not found: ${draftId}`);
        throw new Error('Draft not found');
      }

      // Check access permissions
      if (!isAdmin && userEmail) {
        const hasAccess = draft.createdBy === userEmail || 
                         (draft.access && draft.access.includes(userEmail));
        
        if (!hasAccess) {
          this.logger.warn(`[DraftService] Access denied to draft ${draftId} for user: ${userEmail}`);
          throw new Error('Access denied to this draft');
        }
      }

      this.logger.log(`[DraftService] Successfully retrieved draft ${draftId}`);
      return draft;
    } catch (error) {
      this.logger.error(`[DraftService] Error getting draft ${draftId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async createDraft(draftData, userId, userEmail) {
    this.logger.log(`[DraftService] Creating draft for user: ${userEmail}`);
    
    try {
      // Ensure user has access to their own draft
      const access = draftData.access || [];
      if (!access.includes(userEmail)) {
        access.push(userEmail);
      }

      const createData = {
        name: draftData.name,
        draft: draftData || {},
        createdBy: userEmail,
        access,
        autoSave: draftData.autoSave || false
      };
      
      const draft = await Draft.create(createData);

      this.logger.log(`[DraftService] Successfully created draft ${draft.id}`);
      return draft;
    } catch (error) {
      this.logger.error(`[DraftService] Error creating draft for user ${userEmail}:`, error);
      throw error;
    }
  }

  async updateDraft(draftId, draftData, userEmail = null, isAdmin = false) {
    this.logger.log(`[DraftService] Updating draft ${draftId} for user: ${userEmail}`);
    
    try {
      const draft = await this.getDraft(draftId, userEmail, isAdmin);
      
      // Only allow updating specific fields
      const updateData = {};
      if (draftData.name !== undefined) updateData.name = draftData.name;
      if (draftData.access !== undefined) updateData.access = draftData.access;
      updateData.draft = draftData;
      if (draftData.autoSave !== undefined) updateData.autoSave = draftData.autoSave;
      if (draftData.isActive !== undefined) updateData.isActive = draftData.isActive;
      
      this.logger.log(`[DraftService] Updating draft ${draftId} with fields:`, Object.keys(updateData));
      
      await draft.update(updateData);

      this.logger.log(`[DraftService] Successfully updated draft ${draftId}`);
      return draft;
    } catch (error) {
      this.logger.error(`[DraftService] Error updating draft ${draftId} for user ${userEmail}:`, error);
      throw error;
    }
  }

  async deleteDraft(draftId, userEmail = null, isAdmin = false) {
    this.logger.log(`[DraftService] Deleting draft ${draftId} for user: ${userEmail}`);
    
    try {
      const draft = await this.getDraft(draftId, userEmail, isAdmin);
      
      // Soft delete
      await draft.update({ isActive: false });
      
      this.logger.log(`[DraftService] Successfully deleted draft ${draftId}`);
      return { success: true, message: 'Draft deleted successfully' };
    } catch (error) {
      this.logger.error(`[DraftService] Error deleting draft ${draftId} for user ${userEmail}:`, error);
      throw error;
    }
  }
}

module.exports = new DraftService();