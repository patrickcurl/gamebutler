# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text(65535)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checked_in   :boolean          default(TRUE)
#  last_checkin :datetime
#

class Game < ActiveRecord::Base
	belongs_to :user, class_name: 'User'	
	belongs_to :borrower, class_name: 'User'
	# has_many :renters, through: :rentals
	# has_many :rentals

	
end
