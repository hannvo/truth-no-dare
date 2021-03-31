require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = answers(:one)
  end

  test 'valid answer' do
    assert @answer.valid?
  end

  test 'invalid answer without text' do
    @answer.answer = nil
    assert_not @answer.valid?, 'Answer is valid without a text'
    assert_not_nil @answer.errors[:answer], 'no validation error for answer present'
  end

  test '#question' do
    assert @answer.question
  end
end
