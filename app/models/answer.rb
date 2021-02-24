# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :less_than_5_answers, on: create

  scope :right, -> { where(correct: true) }

  private

  def less_than_5_answers
    errors.add(:answer, 'Слишком много ответов.') if question.answers.count >= 4
  end
end
