# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image_link
      t.string :rule_type
      t.string :rule_value

      t.timestamps
    end
  end
end
