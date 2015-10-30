class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	before_create :create_affiliate_id

	private

	def create_affiliate_id
		affiliate_id = SecureRandom.hex(3)
		@collision = User.find_by_affiliate_id(affiliate_id)

		while !@collision.nil?
		    affiliate_id = SecureRandom.hex(3)
		    @collision = User.find_by_affiliate_id(affiliate_id)
		end

		self.affiliate_id = affiliate_id
	end
end
