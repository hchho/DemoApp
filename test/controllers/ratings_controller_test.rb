require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  def setup
  	@demo = demos(:orange)
  	@user = users(:bill)
    @rating = ratings(:r1)
  end

  test "should redirect create when not logged in" do 
    assert_no_difference 'Rating.count' do 
      post :create, rating: {reviewer: @user, reviewed: @demo } 
    end
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do 
  	patch :update, id: @rating, rating: { rating: 5 }
  	assert_redirected_to login_url
  end

end
