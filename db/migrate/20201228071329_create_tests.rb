# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, null: false, default: 1

      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
