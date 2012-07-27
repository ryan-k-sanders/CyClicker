class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :netid
      t.string :password
      t.string :name
      t.string :picture_url
      t.string :account_type

      t.timestamps
    end
  end
end
