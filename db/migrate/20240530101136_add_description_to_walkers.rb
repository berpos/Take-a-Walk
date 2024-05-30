class AddDescriptionToWalkers < ActiveRecord::Migration[7.1]
  def change
    add_column :walkers, :description, :string
  end
end
