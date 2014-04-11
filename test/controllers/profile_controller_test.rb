require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:chl)
    assert_response :success
  end

  test "should return 404 if user is not found" do
    get :show, id: "blablabal"
    assert_response :not_found
  end

  test "that @user is set" do
    get :show, id: users(:chl)
    assert assigns(:user)
  end

  test "that @statuses is set" do
    get :show, id: users(:chl)
    assert assigns(:statuses)
  end
end
