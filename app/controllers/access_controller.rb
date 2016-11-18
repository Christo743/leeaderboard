class AccessController < ApplicationController

  def index
    @players = Player.first(20)
  end

end
