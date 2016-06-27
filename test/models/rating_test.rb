require 'test_helper'

class RatingTest < ActiveSupport::TestCase
	def setup
		@albert = users(:albert)
		@bill = users(:bill)
		# @newrating = Rating.new()
		# @firstrating = ratings(:r1)
		# @secondrating = ratings(:r2)
		@demo = demos(:orange)
		@newrating = Rating.new(reviewer: @albert, reviewed: @demo)
	end

	test "rating should be valid" do 
		assert @newrating.valid?
	end

	test "rating default should be 2.5" do 
		assert @newrating.value == 2.5
	end

	test "rating should be between 0 and 5" do 
		@newrating.value = 6
		assert_not @newrating.valid?
		@newrating.value = -1
		assert_not @newrating.valid?
	end

	test "rating reviewer should match correct user" do 
		assert_same @newrating.reviewer, @albert
		assert_not_same @newrating.reviewer, @bill
	end 
end
