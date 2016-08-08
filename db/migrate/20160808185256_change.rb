class Change < ActiveRecord::Migration
  def change
    add_column :menu_items, :is_deleted, :boolean, :default => false
    add_column :menu_item_contents, :is_deleted, :boolean, :default => false
    add_column :menu_item_content_groups, :is_deleted, :boolean, :default => false
  end
end
