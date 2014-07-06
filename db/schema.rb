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

ActiveRecord::Schema.define(version: 20140705235905) do

  create_table "survey_users", force: true do |t|
    t.string   "email_digest"
    t.string   "participant_type"
    t.string   "gender"
    t.string   "age"
    t.string   "education"
    t.string   "ms_type"
    t.string   "length_of_time"
    t.string   "care_for"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.integer  "survey_user_id"
    t.string   "survey_type"
    t.string   "marital_status"
    t.string   "employment"
    t.string   "disability"
    t.string   "last_exacerbation"
    t.string   "new_symptoms"
    t.boolean  "continue"
    t.integer  "pil1"
    t.integer  "pil2"
    t.integer  "pil3"
    t.integer  "pil4"
    t.integer  "pil5"
    t.integer  "pil6"
    t.integer  "pil7"
    t.integer  "pil8"
    t.integer  "pil9"
    t.integer  "pil10"
    t.integer  "pil11"
    t.integer  "pil12"
    t.integer  "pil13"
    t.integer  "pil14"
    t.integer  "pil15"
    t.integer  "pil16"
    t.integer  "pil17"
    t.integer  "pil18"
    t.integer  "pil19"
    t.integer  "pil20"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
