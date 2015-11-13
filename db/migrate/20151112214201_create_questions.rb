class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :query, null: false
      t.integer :best_answer_id

      t.timestamps null: false, null: false
    end
  end
end
