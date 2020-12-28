class AddUsersFieldsNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :nickname, false)
    change_column_null(:users, :mail, false)
    change_column_null(:users, :password, false)
  end
end
