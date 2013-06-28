class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  attr_accessible :value, :user_id, :voteable_id, :voteable_type
  validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type], :message => "You've already voted on this! Stop trying to game the system."
end
