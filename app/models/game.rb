class Game < ActiveRecord::Base
	belongs_to :user,
	has_many :renters, through: :game_rentals
	has_many :game_rentals
end
