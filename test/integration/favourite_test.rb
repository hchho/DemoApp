require 'test_helper'

class FavouritesTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@user = users(:albert)
		log_in_as(@user)
	end

	test "user favourited demos page" do 
		get user_path(@user)
		assert_match @user.favourite_demos.count.to_s, response.body
		@user.favourite_demos.each do |d|
			assert_select "a[herf=?]", demo_path(d)
		end
	end
end
