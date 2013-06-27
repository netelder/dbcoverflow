class AddValidationToPostsTitle < ActiveRecord::Migration
  def change
  	change_column :posts do |t|
  		t.string :title, :null => false, :default => ""
  	end
  end
end
