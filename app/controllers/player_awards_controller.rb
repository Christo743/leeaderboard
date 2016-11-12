class PlayerAwardsController < ApplicationController
  before_action :set_player_award, only: [:show, :edit, :update, :destroy]

  # GET /player_awards
  # GET /player_awards.json
  def index
    @player_awards = PlayerAward.all
  end

  # GET /player_awards/1
  # GET /player_awards/1.json
  def show
  end

  # GET /player_awards/new
  def new
    @player_award = PlayerAward.new
  end

  # GET /player_awards/1/edit
  def edit
  end

  # POST /player_awards
  # POST /player_awards.json
  def create
    @player_award = PlayerAward.new(player_award_params)

    respond_to do |format|
      if @player_award.save
        format.html { redirect_to @player_award, notice: 'Player award was successfully created.' }
        format.json { render :show, status: :created, location: @player_award }
      else
        format.html { render :new }
        format.json { render json: @player_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_awards/1
  # PATCH/PUT /player_awards/1.json
  def update
    respond_to do |format|
      if @player_award.update(player_award_params)
        format.html { redirect_to @player_award, notice: 'Player award was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_award }
      else
        format.html { render :edit }
        format.json { render json: @player_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_awards/1
  # DELETE /player_awards/1.json
  def destroy
    @player_award.destroy
    respond_to do |format|
      format.html { redirect_to player_awards_url, notice: 'Player award was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_award
      @player_award = PlayerAward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_award_params
      params.require(:player_award).permit(:player_id, :award_id)
    end
end
