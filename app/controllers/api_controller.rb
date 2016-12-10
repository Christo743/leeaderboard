class ApiController < ApplicationController

  before_action :valid_request, :except => [:highscore, :weeklyHighScore]

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

  # GET REQUEST
  # PARAMS: - count (optional)     = int   default: 20      / number of players returned
  def highscore

    count = 20
    if !params[:count].nil?
      count = params[:count]
    end

    players = Player.order(score: :desc).first(count)
    render :json => players

  end

  # POST REQUEST
  # PARAMS: - count (optional)     = int   default: 20      / number of players returned
  #         - timestamp (optional) = int   default: Today   / the week returned
  def weeklyHighScore

    count = 20
    if !params[:count].nil?
      count = params[:count]
    end

    date = Date.today - 7.days
    if !params[:timestamp].nil?
      date = Time.at(params[:timestamp]).to_datetime
    end

    players = PlayerHistory.where('created_at >= ? and created_at <= ?', date.at_beginning_of_week, date.at_beginning_of_week + 7.days).order(score: :desc).first(count)

    index = 1
    players.each do |playersHistory|
      playersHistory.rank = index
      index = index + 1
    end

    render :json => players


  end


end
