class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :courseCode
      t.string :courseDescription

      t.timestamps
    end
  end
end
