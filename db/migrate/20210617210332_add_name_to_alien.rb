class AddNameToAlien < ActiveRecord::Migration[6.1]
  def change
    add_column :aliens, :name, :string
  end
end
