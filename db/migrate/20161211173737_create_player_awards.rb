class CreatePlayerAwards < ActiveRecord::Migration
  def change
    create_table :player_awards do |t|
      t.integer :player_id
      t.integer :award_id

      t.timestamps null: false
    end
  end
end
