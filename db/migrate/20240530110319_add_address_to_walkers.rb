class AddAddressToWalkers < ActiveRecord::Migration[7.1]
  def change
    add_column :walkers, :address, :string
  end
end
