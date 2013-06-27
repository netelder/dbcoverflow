class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where('post_id=?', params[:id])
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
end
