class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: {questions: @test.questions}
  end

  def new
  end

  def create
    puts 'Trying to create!'
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to @question
    else
      render plain: "Не удалось создать вопрос. Ошибки = #{pp @question.errors.messages}"
    end
  end

  def show
    render json: { question: @question }
  end

  def destroy
    render plain: @question.destroy!.inspect
  end

  private

  def find_test
    puts "params[:test_id] = #{params[:test_id]}"
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
