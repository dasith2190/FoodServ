class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :user
      t.string :name
      t.string :description
      t.float :price
      t.boolean :is_build_your_own
      t.timestamps null: false
    end
  end
end
