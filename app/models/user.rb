class User < ActiveRecord::Base
	validates :email, :presence => true
	validates :email, :uniqueness => true
	validates_format_of :email, :with => /@/
	validates :password, :presence => true 
	validates_format_of :password, :with => /(?=.*[\d\W])/,
        :message => "must contain at least one number or special character"
	validates_length_of :password, :maximum => 20
	validates_length_of :password,  :minimum => 7
		
	has_secure_password
	has_many :articles
	
	# has_many :photos
	# has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 #  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

