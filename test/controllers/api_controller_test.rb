require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get sortnumbers" do
    get :sortnumbers
    assert_response :success
  end

  test "should get getplans" do
    get :getplans
    assert_response :success
  end

end
