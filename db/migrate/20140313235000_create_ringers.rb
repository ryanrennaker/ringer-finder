class CreateRingers < ActiveRecord::Migration
  def change
    create_table :ringers do |t|
      t.integer :user_id
      t.string :first
      t.string :last
      t.boolean :is_male
      t.integer :comp_level
      t.string :city
      t.string :state
      t.string :img_url
      t.text :bio
      t.timestamps
    end
  end
end
