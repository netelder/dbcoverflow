require 'spec_helper'
require 'support/feature_helpers'



describe "User Authentication" do
  include FeatureHelpers

  it "lets a user comment on feedback" do
    visit new_user_registration_path

    fill_in "user[email]", with: "test@test.me"
    fill_in "user[password]", with: "abcabcabc"
    fill_in "user[password_confirmation]", with: "abcabcabc"
    click_button('Sign up')

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "prevents new user from enter short password" do
    visit new_user_registration_path

    fill_in "user[email]", with: "test@test.me"
    fill_in "user[password]", with: "a"
    fill_in "user[password_confirmation]", with: "a"
    click_button('Sign up')

    expect(page).to have_content "Password is too short (minimum is 8 characters)"
  end

  it "prevents new user from entering dup email" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "abcabcabc"
    fill_in "user[password_confirmation]", with: "abcabcabc"
    click_button('Sign up')
    
    expect(page).to have_content "Email has already been taken"
  end

end


