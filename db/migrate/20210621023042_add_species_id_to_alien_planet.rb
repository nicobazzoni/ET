class AddSpeciesIdToAlienPlanet < ActiveRecord::Migration[6.1]
  def change
    add_reference :alien_planets, :species, foreign_key: true
  end
end
