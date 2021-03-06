class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :upvote, :null => false, :default => false
      t.references :user
      t.integer :votable_id, :null => false
      t.string :votable_type, :null => false

      t.timestamps(null: false)
    end
  end
end
