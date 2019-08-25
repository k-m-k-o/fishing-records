require 'csv'
require "open-uri"

CSV.foreach("db/seeds/csv/KEN_ALL.CSV", encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[6]
  cityName = row[7]
  pref = Prefecture.find_or_create_by(name: prefName)
  City.find_or_create_by(name: cityName, prefecture_id: pref.id)
end
