# frozen_string_literal: true

class CreateUserPassedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :user_passed_tests do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
