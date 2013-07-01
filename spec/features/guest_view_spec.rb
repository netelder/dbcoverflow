require 'spec_helper'
require 'support/feature_helpers'

describe "guest view" do
  include FeatureHelpers

  it "doesn't show email to guest user" do
    visit root_path
    expect(page).not_to have_content(/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/)
  end


end