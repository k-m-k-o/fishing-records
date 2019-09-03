require 'csv'
require "open-uri"

CSV.foreach("db/seeds/csv/KEN_ALL.CSV", encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[6]
  cityName = row[7]
  pref = Prefecture.find_or_create_by(name: prefName)
  City.find_or_create_by(name: cityName, prefecture_id: pref.id)
end

cities = City.includes(:prefecture).order("id ASC")

cities.each do |city|
  pref_id = city.prefecture.id
  Area.find_or_create_by(prefecture_id: pref_id,city_id: city.id, name: "#{city.name}某所")
end