class User < ActiveRecord::Base
	validates :email, :presence => true
	validates :email, :uniqueness => true
	validates :password, :presence => true
	validates_length_of :password, :maximum => 20
	validates_length_of :password,  :minimum => 7
	has_secure_password
end