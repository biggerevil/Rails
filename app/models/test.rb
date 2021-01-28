# frozen_string_literal: true

class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  # has_and_belongs_to_many :users
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  def self.sorted_tests_names_of_category(category_title)
    # Возвращаем массив всех названий тестов категории category_title
    Test
      .joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title': category_title)
      .order(title: :DESC)
      .pluck(:title)
  end
end
