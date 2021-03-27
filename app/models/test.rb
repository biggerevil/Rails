# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :time_to_pass_in_minutes, numericality: { greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def time_to_pass_in_seconds
    time_to_pass_in_minutes * 60
  end

  # Возвращаем массив всех названий тестов категории category_title
  def self.sorted_tests_names_of_category(category_title)
    Test
      .joins(:category)
      .where(categories: { title: category_title })
      .order(title: :DESC)
      .pluck(:title)
  end
end
