module Badges
  class FirstTryPassRuleSpecification < AbstractRuleSpecification
    def satisfies?
      attempts = TestPassage.where(
                                   test: @test_passage.test,
                                   user: @test_passage.user
                                  )
      attempts.count == 1 && attempts.first.success
    end
  end
end