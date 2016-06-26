require 'test_helper'

class RatingsTest < ActionDispatch::IntegrationTest
	include ApplicationHelper

	def setup
		@user = users(:albert)
		log_in_as(@user)
	end
end
