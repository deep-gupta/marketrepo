class User < ActiveRecord::Base
  validates :user_type, presence: true
  #after_initialize:set_defaults
  before_create :set_defaults

  
  scope :pending_request, -> { where(:user_type => '2', :status_of_shopkeeper => 'pending') }
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :pictures, :pictures_attributes, :date_of_birth, :email_id, :first_name, :gender, :last_name, :password, :phone_no, :status_of_shopkeeper, :user_type
  
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  
  has_many :shops, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  has_many :orders, dependent: :destroy
  has_many :carts
  
  private
  def set_defaults
    self.status_of_shopkeeper = "pending"
  end
end

