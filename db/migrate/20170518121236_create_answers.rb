class CreateAnswers < ActiveRecord::Migration
  def change
        create_table :answers do |t|
      t.boolean :best_answer?
      t.text :body, :null => false

      t.timestamps(null: false)
    end
    add_foreign_key :post, :class_name => Post
    add_foreign_key :answer, :class_name => Answer
  end
end
