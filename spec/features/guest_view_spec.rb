require 'spec_helper'
require 'support/feature_helpers'

describe "guest view" do
  include FeatureHelpers

  it "doesn't show email to guest user" do
  	visit root_path do
	  	expect(page).should have_no_content('/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/')
	  end
  end


end