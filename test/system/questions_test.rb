require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  def setup
    @board = boards(:two)
  end
  test "creating a question" do
    visit board_url(@board)
    click_on "New Question"
    fill_in "question_text", with: "Tell me something. What is going on?"
    # save_and_open_screenshot
    click_on "Create Question"

    assert_equal url_for(@board), page.current_url
    assert_text "Tell me something. What is going on?"
  end
end
