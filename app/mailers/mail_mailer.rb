class MailMailer < ApplicationMailer
	def main(params)
		@exclusions = ["_gotcha","_next","controller","action"]
		@params = params
		options = {to: params["name"] + "<inbox@joebuhlig.com>", subject: params["_subject"], reply_to: params["_replyto"]}
		mail(options)
	end
end