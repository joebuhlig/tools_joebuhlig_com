class MailController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		redirectLoc = "https://en.wikipedia.org/wiki/Main_Page"
		if (request.headers['origin'] == 'https://joebuhlig.com') && (params["_gotcha"] == '')
			MailMailer.main(params).deliver_now
			if params["_next"]
				redirectLoc = params["_next"]
			end
		end

		redirect_to redirectLoc
	end
end