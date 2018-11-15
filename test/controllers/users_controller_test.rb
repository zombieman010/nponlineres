require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should not get sigup/ not logged in" do
    get signup_path
    follow_redirect!
    assert root_url
    assert_response :success
  end

end
