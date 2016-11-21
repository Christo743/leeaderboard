class ApiController < ApplicationController

  def record_score

    if params[:player_id].nil?
      render :json => {'error': 'player_id missing'}
      return
    end

    if params[:score].nil?
      render :json => {'error': 'score missing'}
      return
    end

    playerHistory = PlayerHistory.new
    playerHistory.player_id = params[:player_id]
    playerHistory.score = params[:score]
    playerHistory.is_weekly = false;

    if playerHistory.save
      render :json => playerHistory
    else
      render :json => {'error': 'there was an error while saving the score'}
    end

  end

end
