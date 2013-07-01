class UsersController < ApplicationController
	def show
		@user = User.find_by_id(params[:id])
		@posts = Post.where(user_id: params[:id])
		if @user
			@gravatar = Digest::MD5.hexdigest(@user.email.downcase) 
		else
			redirect_to :back, alert: "User account no longer exists."
		end
	end
end
