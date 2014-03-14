class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :password
      t.boolean :has_ringer
      t.timestamps
    end
  end
end
