class AddSpeciesIdToPlanets < ActiveRecord::Migration[6.1]
  def change
    add_reference :planets, :species, foreign_key: true
  end
end
