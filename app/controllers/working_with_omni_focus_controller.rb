require 'braintree'

class WorkingWithOmniFocusController < ApplicationController
	protect_from_forgery with: :exception

	def index
		@client_token = Braintree::ClientToken.generate
		@wwo_price = sprintf('%.0f', Rails.configuration.wwo_price)
	end

	def buy
		customer = nil
		customer_flag = false
		result = Braintree::Customer.search do |search|
			search.email.is params[:email]
		end
		result.each do |c|
			customer = c
			customer_flag = true
		end

		unless customer_flag
			result = Braintree::Customer.create(
				:email => params[:email],
				:payment_method_nonce => params[:payment_method_nonce],
				:custom_fields => {
					:affiliate_id => params[:buhlig_aff]
				}
			)
			if result.success?
				customer = result.customer
				customer_flag = true
			end
		end
		affiliate_payment = Rails.configuration.wwo_price * Rails.configuration.affiliate_percentage
		affiliate_payment = sprintf('%.2f', affiliate_payment)

		if customer_flag
			transaction = Braintree::Transaction.sale(
				:amount => Rails.configuration.wwo_price.to_s,
				:customer_id => customer.id,
				:custom_fields => {
					:affiliate_id => params[:buhlig_aff],
					:product_name => params[:product_name],
					:affiliate_payment => affiliate_payment
				},
				:options => {
				    :submit_for_settlement => true
			  	}
		  	)
		  	if transaction.success?
		  		api_key = Rails.application.secrets.MAILCHIMP_API_KEY
			    gibbon = Gibbon::Request.new(api_key: api_key)
			    list_id = Rails.application.secrets.MAILCHIMP_WWO_LIST
			    @signupresult = 'success'
			    begin
			    	OmnifocusMailer.book_purchase(params[:email]).deliver_now
			    	OmnifocusMailer.book_receipt(params[:email], transaction.transaction).deliver_now
			    	gibbon.lists(list_id).members.create(body: {email_address: params[:email], status: "subscribed", double_optin: true, send_welcome: true})
			    rescue Gibbon::MailChimpError => error
			      if error.title
			        if error.title = "Member Exists"
			          @signupresult = "currentmember"
			        end
			      end
			    end
			    logger.debug @signupresult
		  	else
		  		@customer_fail = true
		  	end
		else
			@customer_fail = true
		end
	end
end