class Post < ActiveRecord::Base
  attr_accessible :text, :title, :user_id, :score

  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
  has_many :advices, as: :adviceable

  
  validates :user_id, presence: true
end
