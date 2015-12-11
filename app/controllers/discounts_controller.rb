class DiscountsController < ApplicationController
  def validate_code
  	discount = Discount.find_by(code: params[:code].downcase)
  	sale_price = params[:price]
  	if discount.blank?
  		@code = 100
  		@result = "Invalid Code"
  		@price_change = 0
  	else
  		if discount.flat.blank?
			sale_price = (sale_price.to_f - (sale_price.to_f * discount.percentage)).to_f
		else
			sale_price = (sale_price.to_f - discount.flat).to_f
		end
  		@code = 200
  		@result = "Success!"
  	end

  	sale_price = "$%.2f" % sale_price

  	if request.xhr?
        render :json => {
                            :result_code => @code,
                            :result => @result,
                            :new_price => sale_price
                        }
     end
  end
end
