class ChangeColumnName < ActiveRecord::Migration
  def change
rename_column :carts, :Product_id, :product_id
end
end
