# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_051304) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "post_code", null: false
    t.integer "prefecture_id", null: false
    t.string "address_all", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "information", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "information_date"
    t.text "information_text"
    t.integer "visit_time"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "consent"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "stylist_id", null: false
    t.integer "seat_id", null: false
    t.time "time", null: false
    t.date "date", null: false
    t.integer "menu_id", null: false
    t.integer "user_id", null: false
    t.integer "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stylist_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "rank_text", null: false
    t.integer "stylist_history_id", null: false
    t.integer "nomination", null: false
    t.integer "nomination_price", null: false
    t.integer "style_type_id", null: false
    t.text "style_technique", null: false
    t.text "hobby", null: false
    t.integer "stylist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stylists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "stylist_first_name", null: false
    t.string "stylist_last_name", null: false
    t.string "stylist_first_name_cana", null: false
    t.string "stylist_last_name_cana", null: false
    t.integer "rank_id", null: false
    t.integer "gender_id", null: false
    t.string "catchphrase", null: false
    t.string "self_introduction", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_cana", null: false
    t.string "last_name_cana", null: false
    t.string "email", null: false
    t.date "birthday", null: false
    t.string "phone_number", null: false
    t.integer "gender_id", null: false
    t.integer "stylist_id", null: false
    t.integer "blood_type_id", null: false
    t.integer "job_id", null: false
    t.text "customer_text", null: false
    t.integer "member_id", null: false
    t.integer "customer_number", null: false
    t.integer "age_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
