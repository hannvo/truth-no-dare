class ChangeTextInAnswersToTextfield < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :text, :text
  end
end
