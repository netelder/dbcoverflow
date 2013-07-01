class Advice < ActiveRecord::Base
  belongs_to :user
  belongs_to :adviceable, polymorphic: true
  attr_accessible :content, :user_id, :adviseable_id, :adviseable_type
end