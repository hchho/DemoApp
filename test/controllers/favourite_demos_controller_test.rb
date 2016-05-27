require 'test_helper'

class FavouriteDemosControllerTest < ActionController::TestCase
  test "create should require logged-in user" do 
  	assert_no_difference 'Favourite.count' do 
  		post :create
  	end
  	assert_redirected_to login_url 
  end

  test "destroy should require logged-in user" do 
	assert_no_difference 'Favourite.count' do 
  	  delete :destroy, id: favourites(:one)
  	end
  	assert_redirected_to login_url
  end
end
