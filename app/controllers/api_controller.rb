class ApiController < ApplicationController

  before_action :valid_request
  layout :false

  # POST REQUEST
  def record_score

    if params[:score].nil?
      render :json => {'error': 'score missing'}
      return
    end

    playerHistory = PlayerHistory.new
    playerHistory.player_id = @player_id
    playerHistory.score = params[:score]
    playerHistory.rank = playerHistory.player.player_histories.where('score > ?', params[:score]).count + 1
    if playerHistory.rank == 1
      playerHistory.player.score = params[:score]
      playerHistory.player.save
    end

    if playerHistory.save
      render :json => playerHistory
    else
      render :json => {'error': 'there was an error while saving the score'}
    end

  end

  # DELETE REQUEST
  def delete

    thePlayer = Player.find(@player_id)
    render :json => thePlayer.destroy

  end

  # POST REQUEST
  def edit

    if params[:username].nil?
      render :json => {'error': 'username missing'}
      return
    end

    thePlayer = Player.find(@player_id)
    thePlayer.username = params[:username]
    if thePlayer.save
      render :json => thePlayer
    else
      render :json => {'error': 'there was an error while saving the players'}
    end

  end

end
