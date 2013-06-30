class AddAdvices < ActiveRecord::Migration
  def up
  	create_table :advices do |t|
  		t.references :user
  		t.string :content, :null => false, :default => ""
      t.references :adviseable, polymorphic: true
  	end
    add_index :advices, [:user_id, :adviseable_id, :adviseable_type], :unique => true
  end

  def down
  end
end
