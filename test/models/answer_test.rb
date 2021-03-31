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

  test '#question' do
    assert @answer.question
  end
end
