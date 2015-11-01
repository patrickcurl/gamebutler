class Game < ActiveRecord::Base
	belongs_to :user
	has_many :renters, through: :rentals
	has_many :rentals
end
