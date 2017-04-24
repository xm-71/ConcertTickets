json.venues @venues do |venue|
  json.id venue.id
  json.name venue.name
  json.address venue.address
  json.city venue.city
  json.state venue.state
end
