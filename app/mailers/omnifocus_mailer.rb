class OmnifocusMailer < ApplicationMailer
	def book_purchase(email)
		@email = email
		mail(to: @email, subject: 'Working with OmniFocus')
	end
	def book_receipt(email, transaction)
		@email = email
		@transaction = transaction
		@amount = sprintf('%.2f', transaction.amount)
		mail(to: @email, subject: 'Working with OmniFocus [Receipt]')
	end
end
