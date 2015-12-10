class Transaction < ActiveRecord::Base
	belongs_to :user

	def self.clear_table
		Transaction.delete_all
	end
end
