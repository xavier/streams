class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :stream, index: true
      t.string :category
      t.string :title
      t.string :slug
      t.string :url
      t.text :body
      t.integer :rating

      t.timestamps
    end
    add_index :posts, :slug, unique: true
    add_index :posts, :category
    add_index :posts, :created_at
  end
end
