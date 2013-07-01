class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    @gravatar = Digest::MD5.hexdigest(@user.email.downcase)
  end
end
