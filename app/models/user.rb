class User < ActiveRecord::Base
  validates :user_type, presence: true
  before_save :set_defaults

  private
  def set_defaults
    self.status_of_shopkeeper = "pending"
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :pictures, :pictures_attributes, :date_of_birth, :email_id, :first_name, :gender, :last_name, :password, :phone_no, :status_of_shopkeeper, :user_type

  has_many :user_categories
  has_many :categories, through: :user_categories
  
  has_many :shops
  
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

end

