require 'test_helper'

class FavouritesTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@user = users(:albert)
		log_in_as(@user)
	end

	test "user favourited demos page" do 
		get user_path(@user)
		assert_not @user.favourite_demos.empty?
		assert_match @user.favourite_demos.count.to_s, response.body
	end
end
