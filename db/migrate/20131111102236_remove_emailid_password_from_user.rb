class RemoveEmailidPasswordFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :email_id
    remove_column :users, :password
  end

  def down
    add_column :users, :password, :string
    add_column :users, :email_id, :string
  end
end
