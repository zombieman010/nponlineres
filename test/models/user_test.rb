require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
                     password: "foobar", password_confirmation: "foobar")
  end

  test 'should be valid' do
    assert @user.valid?
  end
  
  test 'name should be present' do 
    @user.name = '       '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ""
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test 'email validation should accept a valid address' do
    valid_addresses = %w[user@example.com TEST@test.Com QA-US-UA@us.as.com
                         first.last@rails.js nathaniel+pautzke@help.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject a valid address' do
    invalid_addresses = %w[user@example,com TEST_test.Com QA-US-UA,us.as.com
                         first.last@rails_new.js nathaniel+pautzke@help+site.cn]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should she be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
