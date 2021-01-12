# frozen_string_literal: true

class User < ApplicationRecord
  def completed_tests_of_level(level)
    passed_tests_ids = UserPassedTest.where(user_id: id).pluck(:test_id)

    # Возвращаем тесты конкретного уровня, пройденные пользователем
    Test.where(id: passed_tests_ids, level: level)
  end
end
