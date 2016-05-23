require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@user = users(:albert)
	end

	test "profile display" do 
		log_in_as(@user)
		get user_path(@user)
		assert_template 'users/show'
		assert_match @user.name, response.body
		assert_match @user.email, response.body
	end
		
end

