# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create!(:name => "Customer")
Role.create!(:name => "Admin")

Concert.create!(name: "BabyMetal", start_date: "2016-03-01 12:00:00", end_date: "2016-03-01 14:00:00", price: "50.00", tickets_available: "100", venue_id: "1")
Concert.create!(name: "GreenDay", start_date: "2016-04-01 12:00:00", end_date: "2016-04-01 14:00:00", price: "50.00", tickets_available: "100", venue_id: "2")
Concert.create!(name: "Fallout Boy", start_date: "2016-05-01 12:00:00", end_date: "2016-05-01 14:00:00", price: "50.00", tickets_available: "100", venue_id: "2")

Venue.create!(name: "Deer Creek", address: "Downtown", city: "Indianapolis", state: "Indiana", zip: "46240")
Venue.create!(name: "Your mom's house", address: "Fountain Square", city: "Indianapolis", state: "Indiana", zip: "46260")
