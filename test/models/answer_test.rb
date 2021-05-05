require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = answers(:one)
  end

  test 'valid answer' do
    assert @answer.valid?
  end

  test 'invalid answer without text' do
    @answer.text = nil
    assert_not @answer.valid?, 'Answer is valid without a text'
    assert_not_nil @answer.errors[:text], 'no validation error for text present'
  end

  test 'invalid answer with too long text' do
    @answer.text = 'When two users are running the same process at the same time, the database can sometimes save the data regardless of the validation constraint and that is where the database constraints (unique index) comes in. If user A and user B are both trying to persist the same username into the database at the same time, rails runs the SELECT query, if the username already exists, it informs both users. However.'
    assert_not @answer.valid?, 'Answer is valid with a text with more than 400 characters'
    assert_not_nil @answer.errors[:text], 'no validation error for text present'
  end

  test '#question' do
    assert @answer.question
  end
end
