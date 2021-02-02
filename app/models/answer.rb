class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :less_than_5_answers

  scope :right, -> { where(correct: true) }

  private

  def less_than_5_answers
    if question.answers.count > 4
      errors.add(:answer, "Слишком много ответов.")
    end
  end
end
