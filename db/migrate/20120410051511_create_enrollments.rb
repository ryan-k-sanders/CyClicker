class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :courseCode
      t.string :sectionNo
      t.string :studentID

      t.timestamps
    end
  end
end
