class OrderDetail < ActiveRecord::Base
  attr_accessible :order_id, :product_name, :product_qty

  belongs_to :order
end
