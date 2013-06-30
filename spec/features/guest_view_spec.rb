require 'spec_helper'
require 'support/feature_helpers'

describe "guest view" do
  include FeatureHelpers

  it "doesn't show email to guest user" do
    visit root_path
    expect(page).not_to have_content(/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/)
  end

  it "lets guests view post content" do
    @post = FactoryGirl.create(:post, text: "I'm a little teapot")
    visit post_path(@post)
    expect(page).to have_content("I'm a little teapot")
  end

end