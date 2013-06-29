require 'spec_helper'
require 'support/feature_helpers'

describe "feedback" do
  include FeatureHelpers

  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user_id: @user.id)
    login(@user)
  end

  it "lets a user post feedback" do
    visit new_post_path
    fill_in "post[title]", with: "DBC should have more cats"
    fill_in "post[text]", with: "I really don't see why there aren't more cats around here"
    click_button "Give Feedback"
    within ".post_title" do
      expect(page).to have_content "DBC should have more cats"
    end
  end

  it "lets a user comment on feedback" do
    visit post_path(@post)
    click_link 'Add Comment'
    fill_in "comment[text]", with: "Some Awesome Feedback"
    click_button "Post" do
      expect(page).to have_content "Some Awesome Feedback"
    end
  end

end