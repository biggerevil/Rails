# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sortedTestsNamesOfCategory(category_title)
    joinedTable = Test.joins('JOIN categories ON tests.category_id = categories.id')

    oneCategoryTable = joinedTable.all.where('categories.title == :category_title', category_title: category_title)

    orderedTable = oneCategoryTable.order('tests.title DESC')

    titlesArray = orderedTable.pluck(:title)

    # Или можно в одну строку:
    # Test.joins('JOIN categories ON tests.category_id = categories.id').where
    # ("categories.title == :category_title", category_title: category_title).
    # order('tests.title DESC').pluck(:title)
  end
end
