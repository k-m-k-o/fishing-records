json.array! @posts do |post|
  json.id post.id
  json.title post.title.truncate(9)
  json.time post.created_at.strftime("%m/%d")
  json.image post.image.thumb.to_s
  json.pref post.prefecture.name
  json.city post.city.name.truncate(9)
  json.fish post.fish
end