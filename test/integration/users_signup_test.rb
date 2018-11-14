require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path,
           params: { user: { name: "",
                             email: "user@invalid",
                             password: "foo",
                             password_confirmation: "bar" }}
    end
    assert signup_url
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path,
           params: { user: { name: "Test User",
                             email: "user@valid.com",
                             password: "123456!Ee",
                             password_confirmation: "123456!Ee" }}
    end
    follow_redirect!
    assert root_url
    assert_not flash.nil?
  end
end
