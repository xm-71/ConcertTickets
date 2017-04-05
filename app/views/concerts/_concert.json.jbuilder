json.extract! concert, :id, :name, :start_date, :end_date, :price, :tickets_available, :created_at, :updated_at
json.url concert_url(concert, format: :json)
