class ApiController < ApplicationController

  before_action :valid_request, :except => [:highscore, :weeklyHighScore, :availableDemographics]

  layout :false

  # Recrods a new score that the player achieved
  # POST REQUEST
  # Requires Header:  - player-id  = int      / player's id
  #                   - password   = string   / players password
  # Body PARAMS:      - score       = int     /  score earned
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

  # Deletes the user with all the records connected to it
  # DELETE REQUEST
  # Requires Header:  - player-id  = int      / player's id
  #                   - password   = string   / players password
  # Body PARAMS:
  def delete

    thePlayer = Player.find(@player_id)
    render :json => thePlayer.destroy, :except => [:password_digest]

  end

  # Edits the user with the parameters specified
  # POST REQUEST
  # Requires Header:  - player-id  = int      / player's id
  #                   - password   = string   / players password
  # Body PARAMS:      - username   = string   / new username of the player
  def edit

    if params[:username].nil?
      render :json => {'error': 'username missing'}
      return
    end

    thePlayer = Player.find(@player_id)
    thePlayer.username = params[:username]
    if thePlayer.save
      render :json => thePlayer, :except => [:password_digest]
    else
      render :json => {'error': 'there was an error while saving the players'}
    end

  end

  # Returns the global highscore, by default only the top 20 players are returned
  # GET/POST REQUEST
  # Requires Header:
  # PARAMS: - count (optional)     = int   default: 20      / number of players returned
  def highscore

    count = 20
    if !params[:count].nil?
      count = params[:count]
    end

    players = Player.order(score: :desc).first(count)
    render :json => players, :except => [:password_digest]

  end

  # Returns the weekly highscore, by default only the top 20 players are returned and the current
  # week's highscore is returned. By specifying a timestamp the hihgscore from that week will be returned
  # GET/POST REQUEST
  # Requires Header:
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

  # Returns the a list of the demographics that are in the database
  # GET/POST REQUEST
  # Requires Header:
  # PARAMS:
  def availableDemographics

    render :json => Player.all.pluck(:demographic).uniq

  end

  # Returns the highscore of a demographic area
  # GET/POST REQUEST
  # Requires Header:
  # PARAMS: - count (optional)     = int   default: 20      / number of players returned
  #         - demographic (optional) = int   default: UK    / the demographic chosen
  def highScoreDemographic

    count = 20
    if !params[:count].nil?
      count = params[:count]
    end

    demographic = 'UK'
    if !params[:demographic].nil?
      demographic = params[:demographic]
    end

    index = 1
    players = Player.where('demographic = ?', demographic).order(score: :desc).first(count)
    players.each do |playersHistory|
      playersHistory.rank = index
      index = index + 1
    end

    render :json => players, :except => [:password_digest]

  end


  # Returns the details of a player with achievements and score history
  # GET/POST REQUEST
  # Requires Header:
  # PARAMS: - player_id     = int   /  player's id that will be returned
  def playerInfo

    if params[:player_id].nil?
      render :json => {'error': 'player_id missing'}
      return
    end

    player = Player.find(params[:player_id])
    player_awawrds = Award.where('id in (?)',player.player_awards.pluck(:award_id))
    render :json => {'player': player, 'awards': player_awawrds, 'scoreHistory': player.player_histories}, :except => [:password_digest]

  end

end
