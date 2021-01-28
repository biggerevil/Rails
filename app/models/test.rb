# frozen_string_literal: true

class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  # Возвращаем массив всех названий тестов категории category_title
  def self.sorted_tests_names_of_category(category_title)

    mbJoinedTable = Test
                      .joins(:category)
                      .where(categories: {title: category_title})
                      .order(title: :DESC)
                      .pluck(:title)
  end
end
