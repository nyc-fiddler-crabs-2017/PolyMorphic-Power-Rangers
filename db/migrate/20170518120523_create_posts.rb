class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :question, :null => false
      t.references :creator

      t.timestamps(null: false)
    end
  end
end
