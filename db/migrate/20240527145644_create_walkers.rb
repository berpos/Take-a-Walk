class CreateWalkers < ActiveRecord::Migration[7.1]
  def change
    create_table :walkers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :photo

      t.timestamps
    end
  end
end
