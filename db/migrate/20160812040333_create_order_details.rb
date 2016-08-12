class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|

      t.timestamps null: false
    end
  end
end
