class AccessController < ApplicationController

  def index
    @players = Player.order(score: :desc).first(20)

    d = Date.today
    @weekly_players = PlayerHistory.where('created_at >= ? and created_at <= ?', d.at_beginning_of_week, d.at_beginning_of_week + 7.days).order(score: :desc).first(20)

  end

  def player

    if params[:id].nil?
      params[:id] = 1
    end

    @player = Player.find(params[:id])

  end

  def login

  end

  def attempt_login

  end

end
