class AddValidationToPostsTitle < ActiveRecord::Migration
  def change
  	change_column :posts, :title, :string, :null => false, :default => ""
  end
end
