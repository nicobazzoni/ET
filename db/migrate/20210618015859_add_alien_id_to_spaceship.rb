class AddAlienIdToSpaceship < ActiveRecord::Migration[6.1]
  def change
    add_reference :spaceships, :alien, foreign_key: true
  end
end
