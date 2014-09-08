class Article < ActiveRecord::Base
	validates :header, :presence => true
end