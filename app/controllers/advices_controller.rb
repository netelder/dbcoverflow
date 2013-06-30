class AdvicesController < ApplicationController

  def new
      @advice = Advice.new()
      @comment = Comment.find(params[:comment_id]) if params.class == Comment
      @post= Post.find(params[:post_id]) if params.class == Post
  end

  def create
    comment = Comment.create(text: params[:comment][:text],
                          post_id: params[:post_id],
                          user_id: current_user.id)
    redirect_to post_path(params[:post_id]), alert: "Thanks for answering!"
  end

end


end
