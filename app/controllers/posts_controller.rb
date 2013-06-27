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

  def vote
    value = params[:type] == "up" ? 1 : -1
    @comment = Post.find(params[:id])
    @comment.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thanks for voting on a comment!"
  end

  def vote
    vote = current_user.votes.new(value: params[:value], voteable_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "You can't vote
    end
  end

end
