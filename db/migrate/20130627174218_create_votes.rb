class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :voteable, polymorphic: true
      t.timestamps
    end

    add_index :votes, [:user_id, :voteable_id, :voteable_type], :unique => true

  end
end
