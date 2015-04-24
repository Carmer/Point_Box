class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :role, default: 0
      t.string :password_digest
      t.integer :points, default: 10

      t.timestamps null: false
    end
  end
end
