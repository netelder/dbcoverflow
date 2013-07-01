module PostsHelper
  def post_author(user_id)
    User.find(user_id).email
  end

  def post_advise(post_id)
  	@output = []
  	advice = Advice.where("adviseable_id =?", params[:id]).where("adviseable_type =?", "Post")
  	advice.each do |a|
  		user = User.find(a.user_id)
  		@output << {user_email: user.email, content: a.content}
  	end
  	@output
  end

  def comment_advise(comments)
    @output = []
    comments.each do |c|
      @output << Advice.where("adviseable_id =?", c.id).where("adviseable_type =?", "Comment")
    end
    @output
  end
end


