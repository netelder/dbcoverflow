class Post < ActiveRecord::Base
  include Voteable
  
  attr_accessible :text, :title, :score

  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
  
  validates :user_id, presence: true
end
