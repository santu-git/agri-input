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

ActiveRecord::Schema.define(version: 20171117054228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "applicant_profiles", force: :cascade do |t|
    t.string "name"
    t.string "mobile_no"
    t.string "gender"
    t.string "prefer_language"
    t.string "id_card_type"
    t.string "id_card_number"
    t.date "dob"
    t.bigint "applicant_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_card_image_file_name"
    t.string "id_card_image_content_type"
    t.integer "id_card_image_file_size"
    t.datetime "id_card_image_updated_at"
    t.index ["applicant_user_id"], name: "index_applicant_profiles_on_applicant_user_id"
  end

  create_table "applicant_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_applicant_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicant_users_on_reset_password_token", unique: true
  end

  create_table "blocks", force: :cascade do |t|
    t.hstore "name"
    t.bigint "subdivision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdivision_id"], name: "index_blocks_on_subdivision_id"
  end

  create_table "communication_addresses", force: :cascade do |t|
    t.string "street_no"
    t.string "post_office"
    t.string "police_station"
    t.string "pin_code"
    t.bigint "applicant_user_id"
    t.bigint "state_id"
    t.bigint "district_id"
    t.string "extended_type"
    t.hstore "extended_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_user_id"], name: "index_communication_addresses_on_applicant_user_id"
    t.index ["district_id"], name: "index_communication_addresses_on_district_id"
    t.index ["state_id"], name: "index_communication_addresses_on_state_id"
  end

  create_table "districts", force: :cascade do |t|
    t.hstore "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "educations", force: :cascade do |t|
    t.hstore "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mouzas", force: :cascade do |t|
    t.hstore "name"
    t.string "jl_number"
    t.bigint "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_mouzas_on_block_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "resource_type"
    t.string "resource_name"
    t.bigint "education_id"
    t.string "passing_institute"
    t.string "passing_year"
    t.string "certificate_number"
    t.string "status"
    t.bigint "applicant_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "certificate_image_file_name"
    t.string "certificate_image_content_type"
    t.integer "certificate_image_file_size"
    t.datetime "certificate_image_updated_at"
    t.index ["applicant_user_id"], name: "index_qualifications_on_applicant_user_id"
    t.index ["education_id"], name: "index_qualifications_on_education_id"
  end

  create_table "states", force: :cascade do |t|
    t.hstore "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdivisions", force: :cascade do |t|
    t.hstore "name"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_subdivisions_on_district_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "owner_name"
    t.bigint "state_id"
    t.bigint "district_id"
    t.string "post_office"
    t.string "police_station"
    t.string "pincode"
    t.text "postal_address"
    t.bigint "applicant_user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_user_id"], name: "index_warehouses_on_applicant_user_id"
    t.index ["district_id"], name: "index_warehouses_on_district_id"
    t.index ["state_id"], name: "index_warehouses_on_state_id"
  end

  add_foreign_key "applicant_profiles", "applicant_users"
  add_foreign_key "blocks", "subdivisions"
  add_foreign_key "communication_addresses", "applicant_users"
  add_foreign_key "communication_addresses", "districts"
  add_foreign_key "communication_addresses", "states"
  add_foreign_key "districts", "states"
  add_foreign_key "mouzas", "blocks"
  add_foreign_key "qualifications", "applicant_users"
  add_foreign_key "qualifications", "educations"
  add_foreign_key "subdivisions", "districts"
  add_foreign_key "warehouses", "applicant_users"
  add_foreign_key "warehouses", "districts"
  add_foreign_key "warehouses", "states"
end
