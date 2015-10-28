class AffiliatesController < ApplicationController

	before_action :authenticate_user!
	def index
		logger.debug "Running affiliate index"
	end
end
