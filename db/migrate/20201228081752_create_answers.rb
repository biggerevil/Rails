class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.string :correct, default: false

      t.references :questions, null: false, foreign_key: true
      t.timestamps
    end
  end
end
