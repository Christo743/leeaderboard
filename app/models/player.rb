class Player < ActiveRecord::Base

  has_secure_password

  has_many :player_awards
  has_many :player_histories

end
