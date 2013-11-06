class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true


   has_many :user_categories
  has_many :users, through: :user_categories
end
