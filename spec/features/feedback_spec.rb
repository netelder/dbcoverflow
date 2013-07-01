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

    within ".post_header" do
      expect(page).to have_content "DBC should have more cats"
    end
  end

  it "lets a user comment on feedback" do
    visit post_path(@post)
    
    click_link 'Add Comment'
    fill_in "comment[text]", with: "Some Awesome Feedback"
    click_button "Add Comment"

    expect(page).to have_content "Some Awesome Feedback"
  end

  it "lets a user vote down a post", js: true do
    visit post_path(@post)

    within '#post_vote_buttons' do
      page.find('.icon-thumbs-down').click

      # this within block is using Capybara's wait-for-it strategy to 
      # wait for the Javascript response to complete
      # without it, we can't grab the updated score
      within '.score' do
        expect(page).not_to have_content "0"
      end

      score = page.find('.score').text
      expect(score).to eq "-1"
    end
  end

  it "lets a user vote down a comment", js: true do
    visit post_path(@post)

    click_link 'Add Comment'
    fill_in "comment[text]", with: "A terrible comment"
    click_button "Add Comment"

    within '.comment_box' do
      page.find('.icon-thumbs-down').click

      within '.score' do
        expect(page).not_to have_content "0"
      end

      score = page.find('.score').text
      expect(score).to eq "-1"
    end
  end

end