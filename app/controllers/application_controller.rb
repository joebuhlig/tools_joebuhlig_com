class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_filter :ref_to_cookie
	def ref_to_cookie
		if params[:ref]
			if !User.find_by_affiliate_id(params[:ref]).nil?
				cookies[:buhlig_aff] = { :value => params[:ref], :expires => 30.days.from_now }
			end
		end
	end
end
