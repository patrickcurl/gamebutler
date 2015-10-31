class User < ActiveRecord::Base
	authenticates_with_sorcery!
	include TheRole::Api::User
 
  validates :password, length: { minimum: 8 }, on: :create
	validates :password, confirmation: true, on: :create
	validates :email, uniqueness: true, email_format: { message: 'Not a valid email.' }, on: :create
	
	# has_many :games, through: 

	def name
	 	([first_name, last_name] - ['']).compact.join(' ')
	end

	def activate
		@user = User.load_from_activation_token(self.activation_token)
		@user.activate!
	end

end
