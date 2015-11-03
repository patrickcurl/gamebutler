# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string(255)      not null
#  crypted_password                :string(255)
#  salt                            :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  first_name                      :string(255)
#  last_name                       :string(255)
#  activation_state                :string(255)
#  activation_token                :string(255)
#  activation_token_expires_at     :datetime
#  role_id                         :integer
#

class User < ActiveRecord::Base
	authenticates_with_sorcery!
	include TheRole::Api::User
 
  validates :password, length: { minimum: 8 }, on: :create
	validates :password, confirmation: true, on: :create
	validates :email, uniqueness: true, email_format: { message: 'Not a valid email.' }, on: :create
	
	# has_many :games, through: 
	has_many :games
	def name
	 	([first_name, last_name] - ['']).compact.join(' ')
	end

	def activate
		@user = User.load_from_activation_token(self.activation_token)
		@user.activate!
	end

end
