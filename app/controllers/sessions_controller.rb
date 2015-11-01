class SessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]
	def new 
	end

	def create
		if login(params[:email], params[:password], params[:remember_me])
			flash[:success] = "Welcome to GameButler!"
			redirect_to dashboard_path
		else
			flash.now[:warning] = "Email and/or password is incorrect."
			render 'new'
		end
	end

	def destroy
		logout
		flash[:success] = "Adios, see ya later!"
		redirect_to log_in_path
	end
end