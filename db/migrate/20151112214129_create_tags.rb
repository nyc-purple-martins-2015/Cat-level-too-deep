class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :category, null: false, uniqueness: true, index: true

      t.timestamps null: false
    end
  end
end
