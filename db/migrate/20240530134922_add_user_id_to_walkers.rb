class AddUserIdToWalkers < ActiveRecord::Migration[7.1]
  def change
    add_reference :walkers, :user, foreign_key: true
  end
end
