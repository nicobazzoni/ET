class AddMoonsToPlanet < ActiveRecord::Migration[6.1]
  def change
    add_column :planets, :moons, :integer
  end
end
