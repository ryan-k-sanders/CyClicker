class CreateStudentAnswers < ActiveRecord::Migration
  def change
    create_table :student_answers do |t|
      t.string :studentID
      t.integer :questionID
      t.integer :number

      t.timestamps
    end
  end
end
