json.extract! award, :id, :name, :image, :is_weekly, :rank, :created_at, :updated_at
json.url award_url(award, format: :json)