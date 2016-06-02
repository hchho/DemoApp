require 'test_helper'

class DemosControllerTest < ActionController::TestCase
	def setup
		@demo = demos(:orange)
	end

	test "should redirect create when not logged in" do
		assert_no_difference 'Demo.count' do			
			post :create, demo: { name: "wtf", content: "lol", materials: "lol", subject_id: 1}
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Demo.count' do
			delete :destroy, id: @demo
		end
		assert_redirected_to login_url
	end

	test "should redirect destroy for wrong demo" do
		log_in_as(users(:albert))
		demo = demos(:apple)
		assert_no_difference 'Demo.count' do
			delete :destroy, id: demo
		end
		assert_redirected_to '/'
	end
end
