require 'test_helper'

class WorkingWithOmniFocusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
