class Product < ActiveRecord::Base
  
  attr_accessible :description,:category_ids, :name, :pictures_attributes, :price, :shop_id
  validates :name,:price, :presence => true

  belongs_to :shop
  
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :carts
end
