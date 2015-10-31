class User < ActiveRecord::Base
	include TheRole::Api::User
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
	validates :password, confirmation: true
	validates :email, uniqueness: true, email_format: { message: 'Not a valid email.' }
	
	# has_many :games, through: 

	def name
	 	([first_name, last_name] - ['']).compact.join(' ')
	end


end
