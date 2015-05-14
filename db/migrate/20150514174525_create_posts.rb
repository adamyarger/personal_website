class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id, index: true

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end
