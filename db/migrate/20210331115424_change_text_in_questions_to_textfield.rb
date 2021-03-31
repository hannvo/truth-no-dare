class ChangeTextInQuestionsToTextfield < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :text, :text
  end
end
