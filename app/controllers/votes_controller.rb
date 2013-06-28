class VotesController < ApplicationController
  
  def create
    p params
    vote = Vote.create(params[:vote])
    current_user.votes << vote
    render :json => { vote_id: vote.id }
  end

  def update
    vote = Vote.find(params[:id])
    vote.update_attributes(params[:vote])
    render :json => {}
  end

end
