class User < ActiveRecord::Base
 #validates :user_type, presence: true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :date_of_birth, :email_id, :first_name, :gender, :last_name, :password, :phone_no, :picture, :status_of_shopkeeper, :user_type

   has_many :user_categories
  has_many :categories, through: :user_categories

   mount_uploader :picture, AvatarUploader


end

