class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :theme, default: "fun"
      t.string :title

      t.timestamps
    end
  end
end
