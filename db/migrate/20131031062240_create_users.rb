class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_id
      t.string :password
      t.string :gender
      t.date :date_of_birth
      t.integer :phone_no
      t.string :user_type
      t.string :status_of_shopkeeper
      t.string :picture

      t.timestamps
    end
  end
end
