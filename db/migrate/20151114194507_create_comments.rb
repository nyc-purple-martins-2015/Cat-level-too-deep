class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false, index: true
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
