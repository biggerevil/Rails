# frozen_string_literal: true

class User < ApplicationRecord
  def completed_tests_of_level(level)
    # Возвращаем тесты конкретного уровня, пройденные пользователем
    Test
      .joins('JOIN user_passed_tests ON tests.id = user_passed_tests.test_id')
      .where(level: level)
  end
end
