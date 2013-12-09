class Mall < ActiveRecord::Base
  attr_accessible :address, :city_id, :name
  validates :name, :presence => true, :uniqueness => {:message => 'Mall already exists'}
  validates :address, :presence => true
  
  belongs_to :city
  has_many :shops
end
