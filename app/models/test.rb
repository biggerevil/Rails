# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sorted_tests_names_of_category(category_title)
    # Возвращаем массив всех названий тестов категории category_title
    Test
      .joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title': category_title)
      .order(title: :DESC)
      .pluck(:title)
  end
end
