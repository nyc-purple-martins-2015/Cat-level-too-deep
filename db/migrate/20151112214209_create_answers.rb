class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, null: false, index: true
      t.references :question, null: false, index: true
      t.text :response, null: false

      t.timestamps null: false
    end
  end
end
