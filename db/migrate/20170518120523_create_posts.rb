class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,
      t.text :question, :null => false

      t.timestamps(null: false)
    end
    add_foreign_key :creator, :class_name => User
  end
end
