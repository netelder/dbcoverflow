module PostsHelper
  def post_author(user_id)
    user = User.find_by_id(user_id)
    if user
    	user.email
    else
    	"deleted user"
  	end
  end
end