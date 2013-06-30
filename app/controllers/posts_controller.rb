class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.order("score DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("score DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new
    end 
  end
end
