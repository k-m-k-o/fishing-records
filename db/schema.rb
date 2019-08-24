# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_24_033334) do

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "toilet", null: false
    t.boolean "car", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prefecture_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_areas_on_city_id"
    t.index ["prefecture_id"], name: "index_areas_on_prefecture_id"
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "fishes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_pictures_on_post_id"
  end

  create_table "post_fishes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "fish_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_post_fishes_on_fish_id"
    t.index ["post_id"], name: "index_post_fishes_on_post_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "how", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fish_id"
    t.bigint "area_id"
    t.bigint "time_zone_id"
    t.bigint "prefecture_id"
    t.bigint "city_id"
    t.index ["area_id"], name: "index_posts_on_area_id"
    t.index ["city_id"], name: "index_posts_on_city_id"
    t.index ["fish_id"], name: "index_posts_on_fish_id"
    t.index ["prefecture_id"], name: "index_posts_on_prefecture_id"
    t.index ["time_zone_id"], name: "index_posts_on_time_zone_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_zones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "time_zones", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "areas", "cities"
  add_foreign_key "areas", "prefectures"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "pictures", "posts"
  add_foreign_key "post_fishes", "fishes"
  add_foreign_key "post_fishes", "posts"
  add_foreign_key "posts", "areas"
  add_foreign_key "posts", "cities"
  add_foreign_key "posts", "fishes"
  add_foreign_key "posts", "prefectures"
  add_foreign_key "posts", "time_zones"
end
