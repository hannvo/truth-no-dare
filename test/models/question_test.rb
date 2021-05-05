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
    assert_not_nil question.errors[:text], 'no validation error for question present'
  end

  test 'invalid question with too long text' do
    @question.text = 'When two users are running the same process at the same time, the database can sometimes save the data regardless of the validation constraint and that is where the database constraints (unique index) comes in. If user A and user B are both trying to persist the same username into the database at the same time, rails runs the SELECT query, if the username already exists, it informs both users. However.'
    assert_not @question.valid?, 'question is valid with a text with more than 400 characters'
    assert_not_nil @question.errors[:text], 'no validation error for text present'
  end

  test '#answers' do
    assert_equal 2, @question.answers.count
  end
end
