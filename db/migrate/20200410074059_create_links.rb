# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.text :url, null: false
      t.string :title
      t.text :description
      t.string :author
      t.string :image
      t.integer :hits_count, default: 0
      t.string :slug, null: false

      t.timestamps
    end

    add_index :links, :slug, unique: true
  end
end
