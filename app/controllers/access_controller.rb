class AccessController < ApplicationController

  def index
    @players = Player.order(score: :desc).first(20)
  end

end
