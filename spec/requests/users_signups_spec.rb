require 'rails_helper'

=begin
  #sign in rspec example
  ----------------------
  describe "the signin process", :type => :feature do
  before :each do
    User.make(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
=end

RSpec.describe "UsersSignups", type: :request do
  describe "signup process" do
    it "success! signs me in" do
      get signup_path

    end
  end
end
