require 'test_helper'

class LinkControllerTest < ActionController::TestCase
  test "should get solve" do
    get :solve
    assert_response :success
  end

end
