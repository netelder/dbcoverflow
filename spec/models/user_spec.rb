require 'spec_helper'

describe User do
  context "create" do
    it "adds user to user database" do
      user = FactoryGirl.create(:user)
      expect(User.find(user.id)).to eq user
    end

    it "doesn't add user if passwords don't match" do
      user = FactoryGirl.build(:user, password_confirmation: "passwrod")
      expect(user.valid?).to be_false
    end

    it "doesn't add user if email is not unique" do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.build(:user)
      expect(user2.valid?).to be_false
    end

  end 
end
