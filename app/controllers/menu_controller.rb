class MenuController < ApplicationController
    before_filter :authenticate_user!
  def new
    @menu_item = MenuItem.new
  end


  def create
    @menu_item = MenuItem.new(menu_params)
    user = current_user.id
    @menu_item.user_id = user
    build_your_own = params["menu_item"]["is_build_your_own"]
    
    if build_your_own == "1" and @menu_item.save
      menu_options = params["group_name"]
      additional_price = params["additional_price"]
      max_allowed = params["max_allowed"]
      
      for i in 0..menu_options.length - 1
        menu_group = MenuItemContentGroup.create(MenuItem_id: @menu_item.id, name: menu_options[i], additional_price: additional_price[i], max_allowed: max_allowed[i])
        menu_item_content = params["menuitemcontent" + i.to_s]
        for j in 0..menu_item_content.length - 1
         MenuItemContent.create(MenuContentGroup_id: menu_group.id, ingredient: menu_item_content[j])
        end
        
      end
    elsif @menu_item.save
        format.html { redirect_to bid_path(@menu_item.id), notice: 'Menu Item was successfully submitted.' }
        format.json { render :show, status: :created, location: @menu_item }
    else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
    end
  end

  
  def edit
    @menu_item = MenuItem.find_by!(id: params[:id], user_id: current_user.id)
  end
  
  
  def update
    @menu_item = MenuItem.find_by!(id: params[:id], user_id: current_user.id)
    build_your_own = @menu_item.is_build_your_own
    
    if @menu_item.update(menu_params)
      
      #If not build your own remove all groups
      if build_your_own and !@menu_item.is_build_your_own
        @menu_item.delete_groups()
      end
      
      removed_groups = params["removed_record"]
      @menu_item.remove_groups(removed_groups)
      
      
    end  
  end

  private

  def menu_params
    params.require(:menu_item).permit(:name, :description, :price, :is_build_your_own)
  end
end
