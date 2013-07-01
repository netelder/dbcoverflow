class AdvicesController < ApplicationController

  def new
      @advice = Advice.new()
      @comment = Comment.find(params[:comment_id]) if params.include?('comment_id')
      @post= Post.find(params[:post_id]) if params.include?('post_id')
  end

  def create
    Advice.create(content: params[:advice][:content],
            adviseable_id: params[:advice][:id],
          adviseable_type: params[:advice][:type],
                  user_id: current_user.id)
    redirect_to post_path(params[:post_id]), alert: "Thanks for the Advice!"
  end

end