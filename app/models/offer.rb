class Offer < ActiveRecord::Base
  attr_accessible :category_id, :from_date, :message, :shop_id, :to_date
  validates :category_id,:shop_id, :presence => true
  
  belongs_to :shop
  belongs_to :category
end
