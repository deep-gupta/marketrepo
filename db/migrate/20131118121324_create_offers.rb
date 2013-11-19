class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :shop_id
      t.date :from_date
      t.date :to_date
      t.integer :category_id
      t.text :message

      t.timestamps
    end
  end
end
