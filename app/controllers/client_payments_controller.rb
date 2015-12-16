class ClientPaymentsController < ApplicationController
	before_filter :authenticate_user!
	def show
		@clientpayment = ClientPayment.find_by(code: params[:id])
	end

	def new
	end

	def create
		@clientpayment = ClientPayment.new(payment_params)
		@clientpayment.paid = false
		@clientpayment.save
		redirect_to @clientpayment
	end
	private
		def payment_params
			params.require(:clientpayment).permit(:description, :amount)
		end
end
