class TechListing < ActiveRecord::Base
	def self.search(search)
		search = search.downcase
		where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search}%", "%#{search}%") 
	end
end
