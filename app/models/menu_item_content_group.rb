class MenuItemContentGroup < ActiveRecord::Base
  belongs_to :MenuItem
  has_many :MenuItemContent, foreign_key: "MenuContentGroup_id"
end
