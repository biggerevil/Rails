# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    # Экономим на кол-во SQL-запросов:
    # correct_answers.count нужен в нескольких местах, при этом
    # его значение никак не меняется, и каждый раз будет происходить
    # запрос. Если сохраним рез-т в переменную заранее, то запросов
    # будет меньше, что хорошо.
    correct_answers_count = correct_answers.count

    # В correct_answers у нас хранятся правильные ответы вопроса.
    # correct_answers.count возвращает кол-во правильных ответов вопроса.
    # correct_answers.where(id: answer_ids) берёт правильные ответы И
    # оставляет из них только те, которые выбрал пользователь. А затем
    # считает их. То есть correct_answers.where(id: answer_ids).count считает,
    # сколько правильных ответов выбрал пользователь.
    #
    # И если кол-во правильных ответов вопроса совпадает с количеством
    # ПРАВИЛЬНЫХ ответов, выбранных пользователем, то вопрос считается
    # решённым верно.
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      # И второе условие - что количество правильных ответов соответствует
      # кол-ву выбранных пользователем ответов
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    # В answer.rb есть scope right, который возвращает только правильные ответы
    current_question.answers.right
  end

  def next_question
    # Подразумеваем, что вопросы упорядочены в порядке создания, то есть
    # чем больше идентификатор, тем дальше идёт вопрос
    # 'id > ?' пишем для предотвращения SQL-инъекции
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
