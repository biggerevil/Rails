class AddTimeToPassToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_to_pass_in_minutes, :integer
  end
end
