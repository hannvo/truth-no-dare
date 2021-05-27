class QuestionsController < ApplicationController
  before_action :find_board, only: [:create]

  def create
    @question = Question.new(question_params)
    @question.board = @board
    if @question.save
      redirect_to board_path(@board)
    else
      respond_to do |format|
        format.js
        @errors = @question.errors.full_messages
      end
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
