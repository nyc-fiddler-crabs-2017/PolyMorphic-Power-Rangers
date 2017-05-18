class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :question, :null => false
      t.references :user

      t.timestamps(null: false)
    end
  end
end
