class Post < ActiveRecord::Base
  attr_accessible :text, :title, :user_id, :score

  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable

  
  validates :user_id, presence: true

  # def score
  # 	self.votes.pluck('value').inject(:+).to_i # to_i to deal with nil case
  # end

end
