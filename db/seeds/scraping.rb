require 'csv'
require "nokogiri"
require "open-uri"


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
