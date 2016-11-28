json.extract! player, :id, :score, :username, :created_at, :updated_at
json.url player_url(player, format: :json)