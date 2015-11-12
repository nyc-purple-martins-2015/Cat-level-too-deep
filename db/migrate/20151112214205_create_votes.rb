class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false, index: true
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.boolean :up_vote

      t.timestamps null: false
    end
  end
end
