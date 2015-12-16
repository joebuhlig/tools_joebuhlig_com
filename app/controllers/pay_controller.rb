require 'braintree'

class PayController < ApplicationController
	before_filter :authenticate_user!, :only => [:summary]
	def index
		@client_token = Braintree::ClientToken.generate
		@clientpayment = ClientPayment.find_by(code: params[:code])
		@amount = @clientpayment.amount
		@fees = (@clientpayment.amount * 0.029) + 0.30
		@total = sprintf('$%.2f', @fees + @clientpayment.amount)
		@amount = sprintf('$%.2f', @amount)
		@fees = sprintf('$%.2f', @fees)
	end

	def summary
		@clientpayments = ClientPayment.all()
	end

	def payment
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
				:payment_method_nonce => params[:payment_method_nonce]
			)
			if result.success?
				customer = result.customer
				customer_flag = true
			end
		end

		@clientpayment = ClientPayment.find_by(code: params[:code])
		@amount = @clientpayment.amount
		@fees = (@clientpayment.amount * 0.029) + 0.30
		sale_price = @fees + @clientpayment.amount
		
		if customer_flag
			logger.info customer.inspect
			transaction = Braintree::Transaction.sale(
				:amount => sale_price,
				:customer_id => customer.id,
				:custom_fields => {
					:product_name => params[:product_name]
				},
				:options => {
				    :submit_for_settlement => true
			  	}
		  	)
			logger.info transaction.inspect
		  	if transaction.success?
			    ClientMailer.client_receipt(params[:email], @clientpayment, transaction.transaction, @amount, @fees, sale_price).deliver_now
			    @clientpayment.paid = true
			    @clientpayment.save
		  	else
		  		@customer_fail = true
		  		@signupresult = transaction.message
		  	end
		else
			@customer_fail = true
			@signupresult = result.message
		end

		redirect_to :action => "index", :code => params[:code]
	end
end
