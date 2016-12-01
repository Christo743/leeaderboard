class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

    def valid_request

      if request.headers['player-id'].nil? || request.headers['password'].nil?
        render json: {'error':'Headers missing'}
        return true
      end

      @player_id = request.headers['player-id']
      password = request.headers['password']

      if Player.find(@player_id).authenticate(password)
        return false
      else
        render json: {'error':'Invalid login details'}
        return true
      end

    end


end
