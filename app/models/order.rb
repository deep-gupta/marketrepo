class Order < ActiveRecord::Base
  attr_accessible :delivery, :user_id, :name, :contact
  
  has_many :order_details
  belongs_to :user
end
