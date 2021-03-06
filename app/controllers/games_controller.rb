class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :checkout, :checkin]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.user = current_user if !@game.user

    respond_to do |format|
      if @game.save
        format.html { redirect_to dashboard_path, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to dashboard_path, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # use for both checkouts and checkins. 
  # def checkout
  #   if @game.checked_in == false then

  #   else

  #   end
  #   @game.checked_in == false ? @game.checked_in=true : @game.checked_in=false
  #   @game.save
  #   redirect_to(:back)
  # end

  def checkout
    @users = User.all
    render :checkout 
  end

  def checkin
    @game.checked_in = true
    @game.borrower_id = nil
    @game.last_checkin = Time.now
    if @game.save then
      redirect_to dashboard_path, notice: "Game was checked in."
    else
      redirect_To dashboard_path, notice: "Unable to checkin."
    end
  end

  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :description, :borrower_id, :user_id, :checked_in, :last_checkin, :last_checkout)
    end
end
