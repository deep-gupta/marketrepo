class Picture < ActiveRecord::Base
	mount_uploader  :image, AvatarUploader
	attr_accessible :image, :imageable_id, :imageable_type

	belongs_to :imageable, polymorphic: true
end
