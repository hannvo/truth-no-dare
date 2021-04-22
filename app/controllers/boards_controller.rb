class BoardsController < ApplicationController
  def show
    @board = Board.friendly.find(params[:id])
    @open_qs = @board.open_questions(4)
    @answers = @board.answers.includes(:question).reverse
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.save ? (redirect_to board_path(@board)) : (render :new)
  end

  private

  def board_params
    params.require(:board).permit(:title, :path)
  end
end
