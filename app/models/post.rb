class Post < ActiveRecord::Base
  attr_accessible :text, :user_id
end