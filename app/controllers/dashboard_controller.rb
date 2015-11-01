class DashboardController < ApplicationController
  def index
  	@game = Game.new
  	@games = Game.all
  	@user = User.new
  	@user = User.all
  	@mygames = Game.where(user_id: current_user.id)
  end
end