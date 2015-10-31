class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :game_id
      t.integer :renter_id
      t.datetime :checkout
      t.datetime :checkin

      t.timestamps null: false
    end
    add_index :rentals, :game_id
    add_index :rentals, :renter_id
    add_foreign_key :rentals, :users, column: :renter_id
  end
end
