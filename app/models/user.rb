# frozen_string_literal: true

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: "Test", dependent: :destroy

  # Возвращаем тесты конкретного уровня, пройденные пользователем
  def completed_tests_of_level(level)
    Test
      .joins('JOIN test_passages ON tests.id = test_passages.test_id')
      .where(level: level)
  end
end
