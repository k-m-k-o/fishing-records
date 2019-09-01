#User.create(id: 1,nickname: "chihaha",email: "kazu@koko.com",password: "veryvery",prefecture_id: 3)
2000.times do |number|
  prefecture = Prefecture.find(rand(1..47))
  cities = prefecture.cities
  num = cities.length
  city = cities[rand(num)]
  area = city.areas[0]
  fish_ids = []
  rand(1..6).times do 
    fish_ids << rand(1..870)
  end
  Post.create(prefecture_id: prefecture.id,city_id: city.id,fish_ids: fish_ids,hour_id: rand(1..8),user_id: 1,title: "テストデータ#{number}",area_id: area.id)
end