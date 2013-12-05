class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.string :product_name
      t.integer :product_qty

      t.timestamps
    end
  end
end
