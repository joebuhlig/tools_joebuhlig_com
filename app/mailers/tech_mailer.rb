class TechMailer < ApplicationMailer
	def new_tech(tech_list)
		new_date = Time.now.strftime("%Y%m%d")
		@new_tech = tech_list
		mail(to: "inbox@joebuhlig.com", subject: 'New Tech Scraped - ' + new_date)
	end
end
