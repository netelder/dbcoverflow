class Comments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.text :text
      t.timestamps
    end
  end
end
