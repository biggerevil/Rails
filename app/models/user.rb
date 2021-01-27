# frozen_string_literal: true

class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test"

  # Возвращаем тесты конкретного уровня, пройденные пользователем
  def completed_tests_of_level(level)
    Test
      .joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where(level: level)
  end
end
