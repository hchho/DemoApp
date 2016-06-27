require 'test_helper'

class RatingsTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@user = users(:albert)
		@firstdemo = demos(:orange)
		@seconddemo = demos(:apple)
		@r1 = ratings(:r1)
		@r2 = ratings(:r2)
		log_in_as(@user)
	end

	# test "demo should average rating value" do 
	# 	@firstdemo.update_average_rating
	# 	assert_match @firstdemo.rating_average, (@r1.value + @r2.value)/@firstdemo.ratings.count
	# end

	# test "demo should create rating if no ratings exists" do 
	# 	assert_difference '@demo.ratings.count', 1 do  
	# 		get demo_path(@seconddemo)
	# 	end
	# 	assert_match '2.5', response.body
	# end	
end

