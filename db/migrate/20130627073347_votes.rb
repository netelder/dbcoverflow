class Votes < ActiveRecord::Migration
  def up
  	create_table :votes do |t|
     	t.string  :value
     	t.integer :user_id

      t.integer :voteable_id
      t.string  :voteable_type

      t.timestamps
    end
  end

  def down
  end
end
