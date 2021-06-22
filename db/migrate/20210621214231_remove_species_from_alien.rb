class RemoveSpeciesFromAlien < ActiveRecord::Migration[6.1]
  def change
    remove_column :aliens, :species
    
  end
end
