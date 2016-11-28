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

end
