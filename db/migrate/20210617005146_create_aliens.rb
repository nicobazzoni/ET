class CreateAliens < ActiveRecord::Migration[6.1]
  def change
    create_table :aliens do |t|
      t.string :species
      t.integer :threat_level
      t.boolean :psychic, :default => true
      t.string :origin

      t.timestamps
    end
  end
end
