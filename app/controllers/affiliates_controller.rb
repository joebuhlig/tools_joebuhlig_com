class AffiliatesController < ApplicationController
	
	def index
		@affiliate = current_user
	end
end
