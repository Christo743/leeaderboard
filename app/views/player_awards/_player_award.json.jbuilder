json.extract! player_award, :id, :player_id, :award_id, :created_at, :updated_at
json.url player_award_url(player_award, format: :json)