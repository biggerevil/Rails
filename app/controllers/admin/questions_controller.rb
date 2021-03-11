# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def show
    @answers = @question.answers
  end

  def destroy
    render plain: @question.destroy!.inspect
  end

  def edit
    @test = Test.find(@question.test_id)
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      @test = Test.find(@question.test_id)
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to [:admin, @question.test]
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title)
  end

  def rescue_with_question_not_found
    render plain: 'Не удалось найти вопрос'
  end
end
