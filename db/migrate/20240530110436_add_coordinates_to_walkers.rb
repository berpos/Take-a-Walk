class AddCoordinatesToWalkers < ActiveRecord::Migration[7.1]
  def change
    add_column :walkers, :latitude, :float
    add_column :walkers, :longitude, :float
  end
end
