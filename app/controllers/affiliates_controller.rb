class AffiliatesController < ApplicationController

	def index
		logger.debug "Running affiliate index"
		@affiliate = current_user
	end
end
