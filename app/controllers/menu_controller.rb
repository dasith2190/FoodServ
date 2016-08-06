class MenuController < ApplicationController
  def new
    @menu_item = MenuItem.new
    @menu_item_content = MenuItemContent.new
    @menu_group = MenuItemContentGroup.new
  end
  
end
