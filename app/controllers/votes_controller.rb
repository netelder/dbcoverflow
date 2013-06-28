class VotesController < ApplicationController
  
  def create
    vote = Vote.create(params[:vote])
    current_user.votes << vote
  end

  def update
    vote = Vote.find(params[:id])
    vote.update_attributes(params[:vote])
    render :json => {}
  end

end
