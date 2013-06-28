class Comment < ActiveRecord::Base

  attr_accessible :text, :user_id, :post_id

  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable
  
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true

  def score
  	self.votes.pluck('value').inject(:+).to_i # to_i to deal with nil case
  end

end
