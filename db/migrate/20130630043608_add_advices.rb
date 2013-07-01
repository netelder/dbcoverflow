class AddAdvices < ActiveRecord::Migration
  def up
  	create_table :advices do |t|
  		t.references :user
  		t.string :content, :null => false, :default => ""
      t.references :adviseable, polymorphic: true
  	end
  end

  def down
  end
end
