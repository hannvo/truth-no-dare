require "test_helper"

class BoardTest < ActiveSupport::TestCase
  def setup
    @board = boards(:one)
    @second_board = boards(:three)
  end

  ### VALIDATION TESTS ###
  test 'valid board' do
    assert @board.valid?
  end

  test 'invalid without theme' do
    @board.theme = nil
    assert_not @board.valid?, 'Board is valid without a theme'
    assert_not_nil @board.errors[:theme], 'no validation error for theme present'
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
    assert_equal 5, @board.questions.count
  end

  test '#answers' do
    assert_equal 3, @board.answers.count
  end

  ### METHOD TESTS ###
  test '#open_questions returns array' do
    assert_instance_of Array, @board.open_questions(1), '#open_questions should return an array'
  end

  # test '#open_questions() returns all unanswered questions' do
  #   assert_equal 3, @board.open_questions.count, '#open_questions() returns wrong number of questions'
  #   assert_equal 5, @second_board.open_questions.count, '#open_questions() returns wrong number of questions'
  # end

  test '#open_questions(n) returns first n unanswered questions' do
    assert_equal 3, @board.open_questions(4).count, '#open_questions() returns wrong number of questions'
    assert_equal 4, @second_board.open_questions(4).count, '#open_questions() returns wrong number of questions'
  end
end
