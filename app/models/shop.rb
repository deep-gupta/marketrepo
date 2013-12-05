class Shop < ActiveRecord::Base
  attr_accessible :mall_id, :name, :user_id
  validates :name, :presence => true, :uniqueness => true 
  
  belongs_to :mall
  belongs_to :user
  has_many :products
  has_many :offers
end
