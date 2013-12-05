class City < ActiveRecord::Base
  attr_accessible :name, :state_id
  validates :name, :presence => true
  belongs_to :state
  has_many :malls
end
