# frozen_string_literal: true

class BadgeDepartmentService
  RULES = {
    'on_first_try' => Badges::FirstTryPassRuleSpecification,
    'passed_all_tests_of_category' => Badges::PassedAllTestsOfCategory,
    'passed_all_tests_of_level' => Badges::PassedAllTestsOfLevel
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type].new(test_passage: @test_passage, value: badge.rule_value)
      add_badges(badge) if rule.satisfies?
    end
  end

  private

  def add_badges(badge)
    @test_passage.user.badges << badge
  end
end
