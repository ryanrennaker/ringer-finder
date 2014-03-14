class CreateRingerSports < ActiveRecord::Migration
  def change
    create_table :ringer_sports do |t|
      t.integer :ringer_id
      t.integer :sport_id
      t.timestamps
    end
  end
end
