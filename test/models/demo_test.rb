require 'test_helper'

class DemoTest < ActiveSupport::TestCase
  def setup
  	@user = users(:albert)
  	@demo = @user.demos.build(name: "wtf", content: "lol", materials: "zzz", subject_id: 1)
    @firstrating = ratings(:r1)
    @rateddemo = demos(:orange)
  end

  test "should be valid" do 
  	assert @demo.valid?
  end

  test "name should be present" do
    @demo.name = ""
    assert_not @demo.valid?
  end

  test "name should not be longer than 40 characters" do 
    @demo.name = "a"*41
    assert_not @demo.valid?
  end
  
  test "content should be present" do
  	@demo.content = ""
  	assert_not @demo.valid?
  end

  test "materials should be present" do
  	@demo.materials = ""
  	assert_not @demo.valid?
  end

  test "subject should be present" do
    @demo.subject_id = ""
    assert_not @demo.valid?
  end
end
