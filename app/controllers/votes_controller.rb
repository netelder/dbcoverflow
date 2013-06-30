class VotesController < ApplicationController
  
  def create
    voteable_object = get_voteable_object(params[:vote])
    
    vote = Vote.new(params[:vote])
    vote.user = current_user
    vote.save

    voteable_object.increment_score(vote.value)
    
    render :json => { vote_id: vote.id, updated_score: voteable_object.score }
  end

  def update
    voteable_object = get_voteable_object(params[:vote])
    
    vote = Vote.find(params[:id])
    vote.update_attributes(params[:vote])
    
    voteable_object.increment_score(vote.value)
    
    render :json => { vote_id: vote.id, updated_score: voteable_object.score }
  end

  private

  def get_voteable_object(params)
    type = params[:voteable_type]
    type.constantize.find(params[:voteable_id])
  end

end
