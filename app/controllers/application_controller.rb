class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_voteable_object(params)
    type = params[:voteable_type]
    id = params[:voteable_id]
    type == "Comment" ? Comment.find(id) : Post.find(id)
  end

  def increment_score(voteable_object, amount)
    voteable_object.score += amount.to_i
    voteable_object.save
  end
end
