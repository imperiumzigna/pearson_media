# frozen_string_literal: true

class AddStatusToStory < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :status, :string
  end
end
