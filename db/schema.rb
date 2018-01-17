# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180115043125) do

  create_table "checklists", force: true do |t|
    t.string   "checklist_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "claim_checklists", force: true do |t|
    t.integer  "claim_id"
    t.integer  "checklist_id"
    t.boolean  "collected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "claims", force: true do |t|
    t.string   "patient_name"
    t.string   "scheme"
    t.string   "village"
    t.string   "taluk"
    t.string   "district"
    t.string   "age"
    t.string   "gender"
    t.string   "mobile_no"
    t.string   "hospital_name"
    t.string   "uhid_no"
    t.string   "inward_no"
    t.string   "ip_no"
    t.string   "surgery_name"
    t.date     "date_of_admission"
    t.date     "date_of_surgery"
    t.date     "date_of_discharge"
    t.string   "procedure_code"
    t.string   "card_no"
    t.string   "urn_no"
    t.string   "reg_no"
    t.string   "status"
    t.decimal  "claim_amount",         precision: 10, scale: 2, default: 0.0
    t.decimal  "approved_amount",      precision: 10, scale: 2, default: 0.0
    t.decimal  "penalty_amount",       precision: 10, scale: 2, default: 0.0
    t.decimal  "final_amount",         precision: 10, scale: 2, default: 0.0
    t.decimal  "tds_amount",           precision: 10, scale: 2, default: 0.0
    t.decimal  "net_amount",           precision: 10, scale: 2, default: 0.0
    t.string   "reason_for_rejection"
    t.string   "utr_no"
    t.string   "aadhar_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
