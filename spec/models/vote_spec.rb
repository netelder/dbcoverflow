require 'spec_helper'

describe Vote do
  describe "validations" do
    it { should belong_to :user }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :user }
    it { should validate_presence_of :voteable }
    it { should validate_presence_of :voteable_id }
    it { should validate_presence_of :voteable_type }
  end
end
