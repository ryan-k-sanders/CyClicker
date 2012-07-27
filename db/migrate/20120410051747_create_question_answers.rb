class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :questionID
      t.integer :number
      t.string :answerText
      t.boolean :correctAnswer

      t.timestamps
    end
  end
end
