class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
