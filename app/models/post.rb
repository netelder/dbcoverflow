class Post < ActiveRecord::Base
  attr_accessible :text, :title, :user_id

  belongs_to :user
  has_many :comments

  validates :user_id, presence: true

  has_reputation :votes, source: :user, aggregated_by: :sum
end
