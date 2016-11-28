class AddAdminToUserAndDeleteWeeklyFromHistory < ActiveRecord::Migration

  def change
    remove_column :player_histories, :is_weekly
    add_column :players, :is_admin, :boolean, default: false
  end


end
