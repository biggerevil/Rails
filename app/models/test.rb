# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sorted_tests_names_of_category(category_title)
    joined_table = Test.joins('JOIN categories ON tests.category_id = categories.id')

    one_category_table = joined_table.where('categories.title': category_title)

    ordered_table = one_category_table.order(title: :DESC)

    # Возвращаем массив всех названий тестов категории category_title
    ordered_table.pluck(:title)
  end
end
