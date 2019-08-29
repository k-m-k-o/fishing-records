User.create(id: 999999999,nickname: "chihaha",email: "kazu@koko.com",password: "veryvery",prefecture_id: 3)
2000.times do |number|
  prefecture = Prefecture.find(rand(1..47))
  cities = prefecture.cities
  num = cities.length
  city = cities[rand(num)]
  fish_ids = []
  rand(1..6).times do 
    fish_ids << rand(1..870)
  end
  Post.create(prefecture_id: prefecture.id,city_id: city.id,fish_ids: fish_ids,hour_id: rand(1..8),how: "ダミーデータです",user_id: 999999999,size: rand(1..100).to_s,many: rand(1..50).to_s,title: "テストデータ#{number}")
end