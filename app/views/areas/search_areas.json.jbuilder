json.array! @areas do |area|
  json.id area.id
  json.name area.name
  json.url "https://www.google.com/maps/embed/v1/search?key=AIzaSyDG9SE3gHgFTU8UkCU-Bo82Zr2fxnJJJ-8&q=#{area.name}+#{area.city.name}+#{area.prefecture.name}"
  json.pref area.prefecture.name
  json.city area.city.name
end