require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  setup do
    #@game = games(:one)
    @user = current_user
    @games = Game.all 

  end
end