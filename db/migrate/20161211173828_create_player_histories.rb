class CreatePlayerHistories < ActiveRecord::Migration
  def change
    create_table :player_histories do |t|
      t.integer :player_id
      t.integer :score
      t.integer :rank
      t.boolean :is_weekly

      t.timestamps null: false
    end
  end
end
