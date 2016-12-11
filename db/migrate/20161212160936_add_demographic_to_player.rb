class AddDemographicToPlayer < ActiveRecord::Migration

  def change
    add_column :players, :demographic, :string, default: "UK"
  end

end
