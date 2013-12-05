class Category < ActiveRecord::Base
  attr_accessible :name
  after_save :display
  validates :name, :presence => true

  def display
    puts"successfully saved"
  end
   
  has_many :user_categories
  has_many :users, through: :user_categories

  has_many :product_categories
  has_many :products, through: :product_categories

  has_many :offers
end
