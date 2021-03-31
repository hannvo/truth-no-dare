require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  def setup
    @board = boards(:two)
    @question = questions(:two)
  end

  test 'valid question' do
    assert questions(:one).valid?
  end

  test 'invalid question without text' do
    question = Question.new
    question.board = @board
    assert_not question.valid?, 'Question is valid without a text'
    assert_not_nil question.errors[:question], 'no validation error for question present'
  end

  test '#answers' do
    assert_equal 2, @question.answers.count
  end
end
