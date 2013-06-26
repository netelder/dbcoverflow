require 'spec_helper'

describe Post do

  context "create a post" do
    it "adds a post to the database" do
      post = FactoryGirl.create(:post)
      expect(Post.find(post.id)).to eq post
    end
    it "requires a user_id to create a post" do
      post = FactoryGirl.build(:post, user_id: nil)
      expect( post.valid?).to eq false
    end
  end


end
