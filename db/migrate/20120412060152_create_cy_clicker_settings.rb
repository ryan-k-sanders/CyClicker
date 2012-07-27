class CreateCyClickerSettings < ActiveRecord::Migration
  def change
    create_table :cy_clicker_settings do |t|
      t.boolean :studentsBlocked

      t.timestamps
    end
  end
end
