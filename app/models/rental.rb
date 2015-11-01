class Rental < ActiveRecord::Base
  belongs_to :game
  belongs_to :renter,
  	class_name: 'User'

end
