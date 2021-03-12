# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :gist_hash
      t.string :link

      t.timestamps
    end
  end
end
