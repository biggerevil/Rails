# frozen_string_literal: true

module TestPassagesHelper
  def all_questions_helper(test_passage)
    pluralize(test_passage.test.questions.count, 'question', plural: 'questions')
  end
end
