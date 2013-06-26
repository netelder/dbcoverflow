module PostsHelper
  def post_author(user_id)
    User.find(user_id).email
  end
end