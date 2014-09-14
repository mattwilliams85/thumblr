class Photo < ActiveRecord::Base
	validates :photo, :attachment_presence => true
	validates_with AttachmentPresenceValidator, :attributes => :photo
	validates_with AttachmentSizeValidator, :attributes => :photo, :less_than => 1.megabytes

	belongs_to :user
end