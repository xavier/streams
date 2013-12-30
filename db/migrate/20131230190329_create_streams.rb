class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.integer :display_order
      t.string :name
      t.string :slug
      t.timestamps
    end
    add_index :streams, :display_order
    add_index :streams, :name, unique: true
    add_index :streams, :slug, unique: true
  end
end
