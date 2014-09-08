class Article < ActiveRecord::Base
	validates :header, :presence => true
	belongs_to :user
end