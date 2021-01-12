# frozen_string_literal: true

class User < ApplicationRecord
  def completed_tests_of_level(level)
    joinedTable = Test.joins('JOIN user_passed_tests ON tests.id = user_passed_tests.test_id')
    # Возвращаем тесты конкретного уровня, пройденные пользователем
    joinedTable.where(level: level)
  end
end
