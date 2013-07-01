class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  include PostsHelper
  def index
    @posts = Post.order("score DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post_advice = post_advise(params[:id])
    @comments = @post.comments.order("score DESC")
    @comment_advice = comment_advise(@comments) if @comments
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params[:post]
    post_params[:user_id] = current_user.id
    if @post = Post.create(post_params)
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    Post.delete(params[:id])
    @notice = "You've deleted you're post."
    redirect_to '/'
  end
end
