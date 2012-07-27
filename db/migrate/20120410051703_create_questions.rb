class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :pollID
      t.integer :number
      t.string :questionText
      t.string :questionType

      t.timestamps
    end
  end
end
