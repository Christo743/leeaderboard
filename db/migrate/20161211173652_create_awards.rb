class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :image
      t.boolean :is_weekly
      t.integer :rank

      t.timestamps null: false
    end
  end
end
