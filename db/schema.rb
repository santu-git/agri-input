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

ActiveRecord::Schema.define(version: 20171130071144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "admin_profiles", force: :cascade do |t|
    t.string "name"
    t.string "mobile_no"
    t.string "gender"
    t.string "prefer_language"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_admin_profiles_on_admin_user_id"
  end

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

  create_table "appointments", force: :cascade do |t|
    t.bigint "designation_id"
    t.bigint "form_a1_id"
    t.datetime "schedule_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designation_id"], name: "index_appointments_on_designation_id"
    t.index ["form_a1_id"], name: "index_appointments_on_form_a1_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.hstore "name"
    t.bigint "subdivision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdivision_id"], name: "index_blocks_on_subdivision_id"
  end

  create_table "certificate_rules", force: :cascade do |t|
    t.bigint "jurisdiction_id"
    t.bigint "certification_type_id"
    t.integer "new_application"
    t.integer "certificate_form"
    t.integer "renew_application"
    t.bigint "role_id"
    t.integer "validity"
    t.string "validity_unit"
    t.integer "validity_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_type_id"], name: "index_certificate_rules_on_certification_type_id"
    t.index ["jurisdiction_id"], name: "index_certificate_rules_on_jurisdiction_id"
    t.index ["role_id"], name: "index_certificate_rules_on_role_id"
  end

  create_table "certification_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communication_addresses", force: :cascade do |t|
    t.string "street_no"
    t.string "post_office"
    t.string "police_station"
    t.string "pin_code"
    t.bigint "applicant_user_id"
    t.bigint "state_id"
    t.bigint "district_id"
    t.bigint "subdivision_id"
    t.string "extended_type"
    t.hstore "extended_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_user_id"], name: "index_communication_addresses_on_applicant_user_id"
    t.index ["district_id"], name: "index_communication_addresses_on_district_id"
    t.index ["state_id"], name: "index_communication_addresses_on_state_id"
    t.index ["subdivision_id"], name: "index_communication_addresses_on_subdivision_id"
  end

  create_table "designations", force: :cascade do |t|
    t.bigint "state_id"
    t.bigint "district_id"
    t.bigint "subdivision_id"
    t.bigint "block_id"
    t.bigint "admin_user_id"
    t.bigint "role_id"
    t.date "joining_date"
    t.date "ending_date"
    t.string "reason"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_designations_on_admin_user_id"
    t.index ["block_id"], name: "index_designations_on_block_id"
    t.index ["district_id"], name: "index_designations_on_district_id"
    t.index ["role_id"], name: "index_designations_on_role_id"
    t.index ["state_id"], name: "index_designations_on_state_id"
    t.index ["subdivision_id"], name: "index_designations_on_subdivision_id"
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

  create_table "form_a1s", force: :cascade do |t|
    t.bigint "role_id"
    t.string "place_type"
    t.bigint "place_id"
    t.bigint "state_id"
    t.string "applicant_name"
    t.string "concern_name"
    t.text "postal_address"
    t.bigint "district_id"
    t.bigint "subdivision_id"
    t.string "extended_address_type"
    t.hstore "extended_address"
    t.bigint "certification_type_id"
    t.bigint "jurisdiction_id"
    t.decimal "registration_fees"
    t.string "challan_no"
    t.date "challan_submission_date"
    t.string "bank_name"
    t.string "enclose_dd_no"
    t.date "enclose_dd_date"
    t.string "payment_for"
    t.string "payment_drawn_on"
    t.string "payment_in_favour_of"
    t.string "payable_at"
    t.boolean "terms_condition"
    t.boolean "declaration"
    t.bigint "applicant_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "application_number"
    t.index ["applicant_user_id"], name: "index_form_a1s_on_applicant_user_id"
    t.index ["certification_type_id"], name: "index_form_a1s_on_certification_type_id"
    t.index ["district_id"], name: "index_form_a1s_on_district_id"
    t.index ["jurisdiction_id"], name: "index_form_a1s_on_jurisdiction_id"
    t.index ["place_type", "place_id"], name: "index_form_a1s_on_place_type_and_place_id"
    t.index ["role_id"], name: "index_form_a1s_on_role_id"
    t.index ["state_id"], name: "index_form_a1s_on_state_id"
    t.index ["subdivision_id"], name: "index_form_a1s_on_subdivision_id"
  end

  create_table "form_a1s_warehouses", id: false, force: :cascade do |t|
    t.bigint "form_a1_id", null: false
    t.bigint "warehouse_id", null: false
    t.index ["form_a1_id", "warehouse_id"], name: "index_form_a1s_warehouses_on_form_a1_id_and_warehouse_id"
  end

  create_table "form_masters", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jurisdictions", force: :cascade do |t|
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

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "admin_profiles", "admin_users"
  add_foreign_key "applicant_profiles", "applicant_users"
  add_foreign_key "appointments", "designations"
  add_foreign_key "appointments", "form_a1s"
  add_foreign_key "blocks", "subdivisions"
  add_foreign_key "certificate_rules", "certification_types"
  add_foreign_key "certificate_rules", "jurisdictions"
  add_foreign_key "certificate_rules", "roles"
  add_foreign_key "communication_addresses", "applicant_users"
  add_foreign_key "communication_addresses", "districts"
  add_foreign_key "communication_addresses", "states"
  add_foreign_key "communication_addresses", "subdivisions"
  add_foreign_key "designations", "admin_users"
  add_foreign_key "designations", "blocks"
  add_foreign_key "designations", "districts"
  add_foreign_key "designations", "roles"
  add_foreign_key "designations", "states"
  add_foreign_key "designations", "subdivisions"
  add_foreign_key "districts", "states"
  add_foreign_key "form_a1s", "applicant_users"
  add_foreign_key "form_a1s", "certification_types"
  add_foreign_key "form_a1s", "districts"
  add_foreign_key "form_a1s", "jurisdictions"
  add_foreign_key "form_a1s", "roles"
  add_foreign_key "form_a1s", "states"
  add_foreign_key "form_a1s", "subdivisions"
  add_foreign_key "mouzas", "blocks"
  add_foreign_key "qualifications", "applicant_users"
  add_foreign_key "qualifications", "educations"
  add_foreign_key "subdivisions", "districts"
  add_foreign_key "warehouses", "applicant_users"
  add_foreign_key "warehouses", "districts"
  add_foreign_key "warehouses", "states"
end
