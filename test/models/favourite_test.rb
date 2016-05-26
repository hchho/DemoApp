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

end
