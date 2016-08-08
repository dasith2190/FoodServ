class MenuItem < ActiveRecord::Base
  has_many :MenuItemContentGroup, foreign_key: "MenuItem_id"
  has_many :MenuItemContent, through: :MenuItemContentGroup
  
  def delete_groups
    self.MenuItemContentGroup.update_all(is_deleted: true)
    self.MenuItemContent.update_all(is_deleted: true)
    self.save()
  end
  
  def remove_groups(ids)
    begin
      self.MenuItemContentGroup.where(id: ids).update_all(is_deleted: true)
      self.MenuItemContent.where(MenuContentGroup_id: ids).update_all(is_deleted: true)
    rescue ActiveRecord::RecordNotFound
    end
  end

end
