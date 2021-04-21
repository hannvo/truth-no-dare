class QuestionsController < ApplicationController
  before_action :find_board, only: [:new, :create]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.board = @board
    if @question.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  private

  def find_board
    @board = Board.friendly.find(params[:board_id])
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
