class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :courseCode
      t.string :sectionNo
      t.string :instructorID

      t.timestamps
    end
  end
end
