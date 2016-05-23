require 'test_helper'

class DemoTest < ActiveSupport::TestCase
  def setup
  	@user = users(:albert)
  	@demo = @user.demos.build(content: "lol", materials: "zzz", subject_id: 1)
  end

  test "should be valid" do 
  	assert @demo.valid?
  end

  test "content should be present" do
  	@demo.content = ""
  	assert_not @demo.valid?
  end

  test "materials should be present" do
  	@demo.materials = ""
  	assert_not @demo.valid?
  end

end
