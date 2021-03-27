# frozen_string_literal: true

module Badges
  class PassedAllTestsOfCategory < AbstractRuleSpecification
    def satisfies?
      @category = Category.where(title: @value).first
      return false unless @test_passage.test.category == @category

      Test.where(category: @category).size == passed_tests_of_category.size
    end

    private

    def passed_tests_of_category
      Test
        .where(category: @category)
        .joins(:test_passages)
        .where(test_passages: { user: @test_passage.user, passed: true })
        .uniq
    end
  end
end
