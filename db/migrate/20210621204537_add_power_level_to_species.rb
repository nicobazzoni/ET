class AddPowerLevelToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_column :species, :power_level, :integer
  end
end
