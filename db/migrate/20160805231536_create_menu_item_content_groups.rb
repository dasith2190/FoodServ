class CreateMenuItemContentGroups < ActiveRecord::Migration
  def change
    create_table :menu_item_content_groups do |t|
      t.references :MenuItem
      t.string :name
      t.integer :max_allowed
      t.float :additional_price
      t.timestamps null: false
    end
  end
end
