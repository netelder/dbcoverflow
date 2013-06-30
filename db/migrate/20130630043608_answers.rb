class Answers < ActiveRecord::Migration
  def up
  	create_table :answers do |t|
  		t.references :user
  		t.string :content, :null => false, :default => ""
      t.references :answerable, polymorphic: true
  	end
    add_index :answers, [:user_id, :answerable_id, :answerable_type], :unique => true
  end

  def down
  end
end
