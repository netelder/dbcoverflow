class CommentsController < ApplicationController

  def new
      @comment = Comment.new()
      @post= Post.find(params[:post_id])
  end

  def create
    comment = Comment.create(text: params[:comment][:text], post_id: params[:post_id], user_id: current_user.id)
    redirect_to post_path(params[:post_id]), alert: "Thanks for your comment!"
  end

end
