class AddSpeciesIdToAlien < ActiveRecord::Migration[6.1]
  def change
    add_reference :aliens, :species, foreign_key: true
  end
end
