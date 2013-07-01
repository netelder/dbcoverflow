class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :votes
  has_many :advices


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def find_vote(voteable)
    self.votes.find_by_voteable_id_and_voteable_type(voteable.id, voteable.class.name)
  end

  def vote_value(voteable)
    vote = find_vote(voteable)
    vote ? vote.value : 0
  end

  def vote_id(voteable)
    vote = find_vote(voteable)
    vote ? vote.id : 0
  end
end
