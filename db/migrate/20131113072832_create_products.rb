class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :shop_id
      t.string :picture
      t.string :description

      t.timestamps
    end
  end
end
