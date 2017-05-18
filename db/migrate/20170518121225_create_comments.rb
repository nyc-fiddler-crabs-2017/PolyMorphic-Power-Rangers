class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, :null => false
      t.references :commenter
      t.integer :commentable_id, :null => false
      t.string :commentable_type, :null => false

      t.timestamps(null: false)
    end
  end
end
