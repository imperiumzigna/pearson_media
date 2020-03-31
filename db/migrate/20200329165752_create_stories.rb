# frozen_string_literal: true

class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :headline
      t.text :body
      t.references :writer, null: true
      t.references :reviewer, null: true
      t.datetime :deleted_at, index: true
      t.timestamps
    end
    add_foreign_key :stories, :users, column: :writer_id, primary_key: :id
    add_foreign_key :stories, :users, column: :reviewer_id, primary_key: :id
  end
end
