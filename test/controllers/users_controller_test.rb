require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
	@user = users(:albert)
	@other_user = users(:bill)
  end

  test "should redirect index when not logged in" do
	get :index
	assert_redirected_to login_url
  end

   test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
  	get :edit, id: @user
  	assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
  	patch :update, id: @user, user: { name: @user.name, email: @user.email, admin: true}
  	assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
  	log_in_as(@other_user)
  	assert_not @other_user.admin?
  	patch :update, id: @other_user, user: { password: "",
  											password_confirmation: "",
  											admin: true}
  	assert_not @other_user.reload.admin?
  end
 
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end
end
