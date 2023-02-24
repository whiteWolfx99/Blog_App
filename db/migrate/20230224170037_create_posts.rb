class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commentcounter
      t.integer :likescounter
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
