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

ActiveRecord::Schema.define(version: 2019_06_29_085544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.integer "companyId"
    t.string "companyFullName"
    t.string "companyShortName"
    t.string "companyLogo"
    t.string "city"
    t.string "industryField"
    t.string "companyFeatures"
    t.string "financeStage"
    t.string "companySize"
    t.integer "interviewRemarkNum"
    t.integer "positionNum"
    t.integer "processRate"
    t.integer "approve"
    t.integer "countryScore"
    t.integer "cityScore"
    t.float "companyCombineScore"
    t.string "isHasValidPosition"
    t.string "otherLabel"
    t.string "updateTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "video_id"
    t.string "duration"
    t.string "img_url"
    t.string "url"
    t.integer "number"
    t.string "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "positionId"
    t.integer "companyId"
    t.string "jobNature"
    t.string "positionName"
    t.string "createTime"
    t.string "salary"
    t.string "workYear"
    t.string "education"
    t.string "positionAdvantage"
    t.jsonb "companyLabelList"
    t.string "district"
    t.string "workDistrict"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer "companyId"
    t.integer "pageNo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.integer "gender"
    t.string "country"
    t.string "province"
    t.string "city"
    t.string "avatarUrl"
    t.string "openid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "intro"
    t.string "img_url"
    t.string "url"
    t.jsonb "actors"
    t.integer "source"
    t.string "score"
    t.string "duration"
    t.integer "video_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
