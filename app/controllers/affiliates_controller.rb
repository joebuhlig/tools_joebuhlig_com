require 'braintree'

class AffiliatesController < ApplicationController
	
	def index
		@affiliate = current_user
		@affiliate_summaries = current_user.affiliate_summaries
	end

	def update_affiliate_numbers

		collection = Braintree::Transaction.search do |search|
			search.status.is Braintree::Transaction::Status::Settled
		end

		collection.each do |transaction|
			unless transaction.custom_fields[:affiliate_id].blank?
				transaction_check = Transaction.find_by(braintree_id: transaction.id)
				if transaction_check.blank?
					user_id = User.find_by(affiliate_id: transaction.custom_fields[:affiliate_id])
					affiliate_id = transaction.custom_fields[:affiliate_id]
					date = transaction.updated_at
					amount = transaction.custom_fields[:affiliate_payment].to_f
					product_name = transaction.custom_fields[:product_name]
					braintree_id = transaction.id
					new_transaction = Transaction.create(affiliate_id: affiliate_id, date: date, amount: amount, product_name: product_name, braintree_id: braintree_id)
				end
			end
		end
	end
end
