class Mall < ActiveRecord::Base
  attr_accessible :address, :city_id, :name
  validates :name,:address, :presence => true
  
  belongs_to :city
  has_many :shops
end
