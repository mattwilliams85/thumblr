class User < ActiveRecord::Base
	validates :email, :presence => true
	validates :email, :uniqueness => true
	validates_format_of :email, :with => /@/
	validates :password, :presence => true 
	validates :password, numericality: { any: true, 
		message: "Password must have at least one number"}
	validates_length_of :password, :maximum => 20
	validates_length_of :password,  :minimum => 7
		
	has_secure_password
	has_many :articles

end

# validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
#     message: "only allows letters" }

