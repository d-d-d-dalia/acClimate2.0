class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.integer :guess
      t.date :date
      t.float :temperature

      t.timestamps
    end
  end
end
