# frozen_string_literal: true

module QuestionsHelper
  def question_header(test)
    if @question.new_record?
      "Create New #{test.title} Question"
    else
      "Edit #{test.title} Question"
    end
  end
end
