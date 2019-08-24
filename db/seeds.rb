# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require "nokogiri"
require "open-uri"

CSV.foreach("db/seeds/csv/KEN_ALL.CSV", encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[6]
  cityName = row[7]
  pref = Prefecture.find_or_create_by(name: prefName)
  City.find_or_create_by(name: cityName, prefecture_id: pref.id)
end


url = "https://ja.wikipedia.org/wiki/%E9%AD%9A%E3%81%AE%E4%B8%80%E8%A6%A7"

contents = []
doc = (Nokogiri::HTML(open(url)))
doc.css("td").css("ul").css("li").css("a").each do |link|
  data = [link.content, link[:href]]
  contents << data
end

CSV.open("db/seeds/csv/fish_names.csv","w") do |csv| 
  contents.each do |content|
    csv << content
  end  
end  

CSV.foreach("db/seeds/csv/fish_names.csv", encoding:"UTF-8") do |row|
  fish_name = row[0]
  fish_url = row[1]
  Fish.find_or_create_by(name: fish_name, url: ("https://ja.wikipedia.org" + fish_url))
end  

