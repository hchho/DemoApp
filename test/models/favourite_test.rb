require 'test_helper'

class FavouriteTest < ActiveSupport::TestCase
	def setup
		@user = users(:albert)
		@demo = demos(:orange)
		@favourite = Favourite.create(favourited: @demo, user: @user)
	end

	test "should be valid" do 
		assert @favourite.valid?
	end

	test "favourite should have user id" do 
		@favourite.user_id = nil
		assert_not @favourite.valid?
	end

	test "favourite should have favourited id" do 
		@favourite.favourited_id = nil
		assert_not @favourite.valid?
	end
	
end
