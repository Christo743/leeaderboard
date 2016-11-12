class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :score
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
