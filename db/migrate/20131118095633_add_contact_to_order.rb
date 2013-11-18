class AddContactToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :contact, :string
  end
end
