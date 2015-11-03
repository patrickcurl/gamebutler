class DashboardController < ApplicationController
  def index
  	@game = Game.new
  	@games = Game.all
  	@user = User.new
  	@users = User.all
  	@mygames = Game.where(user_id: current_user.id)
  	@borrowed = Game.where(checked_in: false)
  end
end