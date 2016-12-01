class Award < ActiveRecord::Base

  has_many :player_awards, :dependent => :delete_all

end
