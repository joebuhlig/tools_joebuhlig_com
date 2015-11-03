require 'braintree'

class WorkingWithOmniFocusController < ApplicationController
	protect_from_forgery with: :exception

	def index
		@client_token = Braintree::ClientToken.generate
	end

	def buy
		result = Braintree::Customer.search do |search|
			search.email.is params[:email]
		end

		customer = ""
		customer_flag = false
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

		transaction = Braintree::Transaction.sale(
			:amount => "17.00",
			:customer_id => customer.id,
			:custom_fields => {
				:affiliate_id => params[:buhlig_aff],
				:product_name => params[:product_name]
			},
			:options => {
			    :submit_for_settlement => true
		  	}
	  	)
	end
end