class VotesController < ApplicationController
  
  def create
    voteable_object = get_voteable_object(params[:vote])
    vote = Vote.create(params[:vote])
    current_user.votes << vote
    increment_score(voteable_object, vote.value)
    
    render :json => { vote_id: vote.id, updated_score: voteable_object.score }
  end

  def update
    voteable_object = get_voteable_object(params[:vote])
    vote = Vote.find(params[:id])
    vote.update_attributes(params[:vote])
    increment_score(voteable_object, vote.value)

    render :json => { vote_id: vote.id, updated_score: voteable_object.score }
  end

end
