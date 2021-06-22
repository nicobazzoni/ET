class AddSpaceshipIdToAlien < ActiveRecord::Migration[6.1]
  def change
    add_reference :aliens, :spaceship, foreign_key: true
  end


 
end
