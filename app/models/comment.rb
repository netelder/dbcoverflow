class Comment < ActiveRecord::Base

  attr_accessible :text, :user_id, :post_id

  belongs_to :user
  belongs_to :post
  
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true


end