class AddCheckinsToGames < ActiveRecord::Migration
  def change
    add_column :games, :checked_in, :boolean, default: true
    add_column :games, :last_checkin, :datetime
    add_column :games, :last_checkout, :datetime
    add_column :games, :borrower_id, :string
  end
end
