# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

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
