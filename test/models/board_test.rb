require "test_helper"

class BoardTest < ActiveSupport::TestCase
  def setup
    @board = boards(:one)
  end

  ### VALIDATION TESTS ###
  test 'valid board' do
    assert @board.valid?
  end

  test 'invalid without path' do
    @board.path = nil
    assert_not @board.valid?, 'Board is valid without a path'
    assert_not_nil @board.errors[:path], 'no validation error for path present'
  end

  test 'invalid without unique path' do
    Board.create(path: 'My path', title: 'My Title')
    board_copy = Board.new(path: 'My path', title: 'Whatever')
    assert_not board_copy.valid?, 'Board is valid with duplicate path'
    assert_not_nil board_copy.errors[:path], 'no validation error for path present'
  end

  test 'invalid without title' do
    @board.title = nil
    assert_not @board.valid?, 'Board is valid without a title'
    assert_not_nil @board.errors[:title], 'no validation error for title present'
  end

  test 'invalid with title longer than 40 characters' do
    @board.title = "Very long title much longer than forty characters"
    assert_not @board.valid?, 'Board is valid with a title longer than 40 chars'
    assert_not_nil @board.errors[:title], 'no validation error for title present'
  end

  ### ASSOCIATION TESTS ###
  test '#questions' do
    assert_equal 2, @board.questions.count
  end

  test '#answers' do
    assert_equal 3, @board.answers.count
  end
end
