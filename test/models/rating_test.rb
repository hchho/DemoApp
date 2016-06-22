require 'test_helper'

class RatingTest < ActiveSupport::TestCase
	def setup
		@rating = Rating.new()
	end

	test "rating default should be 2.5" do 
		assert @rating.value == 2.5
	end

	test "rating should be less than or equal to 5" do 
		@rating.value = 6
		assert_not @rating.valid?
	end

	test "rating should be greater or equal to zero" do 
		@rating.value = -1
		assert_not @rating.valid?
	end
end
