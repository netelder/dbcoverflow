class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :votes


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def vote_value(voteable)
    vote_found = self.votes.find_by_voteable_id_and_voteable_type(voteable.id, voteable.class.name)
    vote_found ? vote_found.value : 0
  end

  def vote_id(voteable)
    vote_found = self.votes.find_by_voteable_id_and_voteable_type(voteable.id, voteable.class.name)
    vote_found ? vote_found.id : 0
  end
end
