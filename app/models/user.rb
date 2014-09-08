class User < ActiveRecord::Base
	validates :email, :presence => true
	validates :email, :uniqueness => true
	validates :password, :presence => true,
						 :length => {:max => 20},
						 :length => {:min => 7}
end