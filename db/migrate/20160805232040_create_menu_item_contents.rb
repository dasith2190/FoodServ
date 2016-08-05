class CreateMenuItemContents < ActiveRecord::Migration
  def change
    create_table :menu_item_contents do |t|
      t.references :MenuContentGroup
      t.string :ingredient

      t.timestamps null: false
    end
  end
end
