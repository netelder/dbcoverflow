class Comment < ActiveRecord::Base
  include Voteable

  attr_accessible :text, :score

  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable
  
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true
end
