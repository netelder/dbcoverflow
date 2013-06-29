class VotesController < ApplicationController
  
  def create
    vote_params = params[:vote]
    voteable_object = get_voteable_object(vote_params[:voteable_type], vote_params[:voteable_id])
    vote = Vote.create(vote_params)
    voteable_object.score += vote.value.to_i
    voteable_object.save

    current_user.votes << vote
    render :json => { vote_id: vote.id, updated_score: voteable_object.score }
  end

  def update
    vote_params = params[:vote]
    voteable_object = get_voteable_object(vote_params[:voteable_type], vote_params[:voteable_id])
    vote = Vote.find(params[:id])
    vote.update_attributes(vote_params)
    voteable_object.score += vote.value.to_i
    voteable_object.save

    render :json => { vote_id: vote.id, updated_score: voteable_object.score }
  end

  private

  def get_voteable_object(type, id)
    type == "Comment" ? Comment.find(id) : Post.find(id)
  end

end
