json.array! @areas do |area|
  json.id area.id
  json.name area.name
  json.pref area.prefecture.name
  json.city area.city.name
end