# frozen_string_literal: true

class User < ApplicationRecord

  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test"

  def completed_tests_of_level(level)
    # Возвращаем тесты конкретного уровня, пройденные пользователем
    Test
      .joins('JOIN tests_users ON tests.id = tests_users.test_id')
      .where(level: level)
  end
end
