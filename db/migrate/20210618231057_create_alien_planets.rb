class CreateAlienPlanets < ActiveRecord::Migration[6.1]
  def change
    create_table :alien_planets do |t|
      t.string :name

      t.timestamps
    end
  end
end
