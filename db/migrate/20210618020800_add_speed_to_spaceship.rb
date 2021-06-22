class AddSpeedToSpaceship < ActiveRecord::Migration[6.1]
  def change
    add_column :spaceships, :speed, :decimal
  end
end
