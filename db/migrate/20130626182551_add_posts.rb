class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.references :user
    end
  end
end
