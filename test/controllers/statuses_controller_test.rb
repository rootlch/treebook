require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "New: should redirect when user is not signed in" do
    get :new
    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "New: should allow creating a new post if signed in" do
    sign_in users(:chl)
    get :new
    assert_response :success
  end

  test "Create: should create status if signed in" do
    sign_in users(:chl)
    assert_difference('Status.count') do
      post :create, status:  {content: "testing", user_id: users(:chl).id}
    end

    assert_response :redirect
    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "Edit: should be redirected if not signed in" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "Edit: should be able to edit if signed in" do
    sign_in users(:chl)
    get :edit, id: @status
    assert_response :success
  end

  test "Update: should redirect to sign in if not signed in" do
    patch :update, id: @status, status: { content: @status.content, user_id: @status.user_id }
    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "Update: should update status if signed in" do
    sign_in users(:chl)
    patch :update, id: @status, status: { content: @status.content, user_id: @status.user_id }
    assert_redirected_to status_path(assigns(:status))
  end

  test "Update: should actually update the status" do
    sign_in users(:chl)
    content = @status.content
    patch :update, id: @status, status: { content: "blabla", user_id: @status.user_id }
    assert_not_equal Status.find(@status.id).content, content
  end

  test "Destroy: should redirect if not signed in" do
    delete :destroy, id: @status
    assert_response :redirect
    assert_redirected_to :new_user_session
  end

  test "should destroy status if signed in" do
    sign_in users(:chl)
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
