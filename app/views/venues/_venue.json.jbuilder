json.extract! venue, :id, :name, :address, :city, :state, :zip, :created_at, :updated_at
json.url venue_url(venue, format: :json)
