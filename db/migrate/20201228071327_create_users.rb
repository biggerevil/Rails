# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :nickname, null: false
      t.text :mail, null: false
      t.text :password, null: false

      t.timestamps
    end
  end
end
