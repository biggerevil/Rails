# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil? || time_run_out?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def procent
    @percentage = (self.correct_questions.to_f /
                  self.test.questions.count * 100).to_i
  end

  def success
    procent >= SUCCESS_PERCENT
  end

  def current_question_order_number
    test_questions_ids = self.test.questions.pluck(:id)
    index_of_current_q = test_questions_ids.find_index(current_question.id)
    index_of_current_q += 1
  end

  def time_remaining
    self.test.time_to_pass_in_seconds - (Time.now - self.created_at)
  end

  private

  def time_run_out?
    Time.now - self.created_at > (self.test.time_to_pass_in_seconds)
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.right
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
