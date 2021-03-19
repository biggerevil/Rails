module Badges
  class PassedAllTestsOfLevel < AbstractRuleSpecification
    def satisfies?
      @level = @value.to_i
      return false unless @test_passage.test.level == @level

      Test.where(level: @level).size == passed_tests_of_level.size
    end

    private

    def passed_tests_of_level
      Test
        .where(level: @level)
        .joins(:test_passages)
        .where(test_passages: { user: @test_passage.user, passed: true })
        .uniq
    end
  end
end