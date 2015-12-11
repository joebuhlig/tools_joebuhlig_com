require 'test_helper'

class DiscountsControllerTest < ActionController::TestCase
  test "should get validate_code" do
    get :validate_code
    assert_response :success
  end

end
