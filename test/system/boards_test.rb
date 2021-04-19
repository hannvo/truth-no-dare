require "application_system_test_case"

class BoardsTest < ApplicationSystemTestCase
  test "visiting the homepage" do
    visit root_url
    assert_selector "h1", text: "Truth no dare"
  end

  test "lets a visitor create a new board" do
    visit root_url
    # save_and_open_screenshot

    fill_in "board_title", with: "Test Title"
    fill_in "board_path", with: "truthnodare"
    # save_and_open_screenshot

    click_on 'Create Board'
    # save_and_open_screenshot

    # Should be redirected to boards show page
    assert_equal "/boards/truthnodare", page.current_path
    save_and_open_screenshot
    assert_text "Test Title"
  end
end
