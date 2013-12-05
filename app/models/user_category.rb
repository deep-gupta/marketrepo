class UserCategory < ActiveRecord::Base
  attr_accessible :category_id, :user_id
  validates :category_id, :user_id, :presence => true
  
  belongs_to :user
  belongs_to :category
end
