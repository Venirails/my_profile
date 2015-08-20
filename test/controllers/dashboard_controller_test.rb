require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get edit_profile" do
    get :edit_profile
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
