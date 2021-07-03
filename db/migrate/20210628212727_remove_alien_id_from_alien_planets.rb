class RemoveAlienIdFromAlienPlanets < ActiveRecord::Migration[6.1]
  def change
    remove_column :alien_planets, :alien_id
  end
end
