class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, :null => false
      t.boolean :best_answer
      t.references :post
      t.references :user

      t.timestamps(null: false)
    end
  end
end
