class ClientMailer < ApplicationMailer
	def client_receipt(email, clientpayment, transaction, amount, fees, total)
		@email = email
		@clientpayment = clientpayment
		@transaction = transaction
		@amount = sprintf('$%.2f', amount)
		@fees = sprintf('$%.2f', fees)
		@total = sprintf('$%.2f', total)
		mail(to: @email, subject: 'Payment for ' + @clientpayment.code + ' [Receipt]')
	end
end
