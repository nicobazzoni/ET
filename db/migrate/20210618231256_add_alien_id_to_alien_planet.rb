class AddAlienIdToAlienPlanet < ActiveRecord::Migration[6.1]
  def change
    add_reference :alien_planets, :alien, foreign_key: true
  end
end
