class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create, :activate]
	before_action :set_user, only: [:edit, :update]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to GameButler!"
			login(params[:user][:email], params[:user][:password])
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	# GET /games/1/edit
  def edit
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to dashboard_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
	def set_user
      @user = User.find(params[:id])
    end
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
	end

end