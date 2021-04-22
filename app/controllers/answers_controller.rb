class AnswersController < ApplicationController
  before_action :find_question, only: [:new, :create]
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to board_path(@question.board)
    else
      render :new
    end
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:text)
  end
end
