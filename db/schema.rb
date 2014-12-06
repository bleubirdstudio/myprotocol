ActiveRecord::Schema.define(version: 20141206045227) do

  create_table "coaches", force: true do |t|
    t.string   "name"
    t.string   "business"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.text     "certifications"
    t.text     "bio"
    t.string   "quote"
    t.string   "quoter"
    t.string   "shirt_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "profile_restrictions", force: true do |t|
    t.integer  "profile_id"
    t.integer  "restriction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "zipcode"
    t.string   "gender"
    t.string   "body_type"
    t.date     "birthday"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "waist"
    t.string   "blood_type"
    t.string   "veggies_per_day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "restrictions", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
