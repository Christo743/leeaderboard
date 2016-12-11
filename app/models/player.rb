class Player < ActiveRecord::Base

  has_secure_password

  has_many :player_awards, :dependent => :delete_all
  has_many :player_histories, :dependent => :delete_all

  attr_accessor :rank #both

  def to_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end

end
