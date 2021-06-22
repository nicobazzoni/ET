class AddPlanetIdToAlienPlanet < ActiveRecord::Migration[6.1]
  def change
    add_reference :alien_planets, :planet, foreign_key: true
  end
end
