require 'mailchimp'
require 'gibbon'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

	before_create :create_affiliate_id
	has_many :affiliate_payments
	has_many :transactions
	has_many :affiliate_summaries

	# Override Devise::Confirmable#after_confirmation
	def after_confirmation
		super
	    api_key = Rails.application.secrets.MAILCHIMP_API_KEY
	    gibbon = Gibbon::Request.new(api_key: api_key)
	    list_id = Rails.application.secrets.MAILCHIMP_AFFILIATE_LIST
	    @signupresult = 'success'
	    begin
	      gibbon.lists(list_id).members.create(body: {email_address: self.email, status: "subscribed", double_optin: false, send_welcome: false})
	    rescue Gibbon::MailChimpError => error
	      if error.title
	        if error.title = "Member Exists"
	          @signupresult = "currentmember"
	        end
	      end
	    end
	    logger.debug @signupresult
	end

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
