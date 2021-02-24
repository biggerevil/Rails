# frozen_string_literal: true

class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :user, { foreign_key: true, null: false }
      t.references :test, { foreign_key: true, null: false }

      t.timestamps
    end
  end
end
