class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :courseCode
      t.string :name
      t.boolean :open

      t.timestamps
    end
  end
end
