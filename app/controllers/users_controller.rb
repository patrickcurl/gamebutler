class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create, :activate]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to GameMonkey!"
			login(params[:user][:email], params[:user][:password])
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def activate
		if @user = User.load_from_activation_token(params[:id])
			@user.activate!
			flash[:success] = "You've been activated!"
			redirect_to log_in_path
		else
			flash[:warning] = "Cannot activate user."
			redirect_to root_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
	end

end