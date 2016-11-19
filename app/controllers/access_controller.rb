class AccessController < ApplicationController

  def index
    @players = Player.order(score: :desc).first(20)
  end

  def player

    if params[:id].nil?
      params[:id] = 1
    end

    @player = Player.find(params[:id])


  end

end
