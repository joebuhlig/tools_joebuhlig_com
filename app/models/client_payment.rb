class ClientPayment < ActiveRecord::Base
	before_create :create_payment_code
	self.primary_key = "code"
	
	def create_payment_code
		code = SecureRandom.hex(3)
		@collision = ClientPayment.find_by_code(code)

		while !@collision.nil?
		    code = SecureRandom.hex(3)
		    @collision = ClientPayment.find_by_code(code)
		end

		self.code = code
	end
end
