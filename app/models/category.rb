class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => {:message => 'Category already exists'}

  has_many :user_categories
  has_many :users, through: :user_categories

  has_many :product_categories
  has_many :products, through: :product_categories

  has_many :offers
end
