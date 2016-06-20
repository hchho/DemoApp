require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  def setup
  	@demo = demos(:orange)
  	@user = users(:bill)
  	@rating = Rating.create(reviewer: @user, reviewed: @demo)
  end

  test "should redirect update when not logged in" do 
  	patch :update, id: @rating, user: { name: @user.name, email: @user.email, admin: true}
  	assert_redirected_to login_url
  end

end
