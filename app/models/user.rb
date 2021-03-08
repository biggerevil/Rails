# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :mail, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :nickname, presence: true

  has_secure_password

  # Возвращаем тесты конкретного уровня, пройденные пользователем
  def completed_tests_of_level(level)
    Test
      .joins(:test_passages)
      .where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
