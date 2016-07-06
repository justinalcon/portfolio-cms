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

ActiveRecord::Schema.define(version: 20160706170551) do

  create_table "announcements", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "published"
  end

  create_table "expertise_organizations", force: :cascade do |t|
    t.integer "organization_id", limit: 4
    t.integer "expertise_id",    limit: 4
  end

  create_table "expertise_projects", force: :cascade do |t|
    t.integer "project_id",   limit: 4
    t.integer "expertise_id", limit: 4
  end

  create_table "expertise_specialties", force: :cascade do |t|
    t.integer "specialty_id", limit: 4
    t.integer "expertise_id", limit: 4
  end

  create_table "expertise_technologies", force: :cascade do |t|
    t.integer "expertise_id",  limit: 4
    t.integer "technology_id", limit: 4
  end

  create_table "expertises", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "images", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.string  "location",      limit: 255
    t.integer "technology_id", limit: 4
  end

  create_table "organization_projects", force: :cascade do |t|
    t.integer "project_id",      limit: 4
    t.integer "organization_id", limit: 4
  end

  create_table "organization_specialties", force: :cascade do |t|
    t.integer "specialty_id",    limit: 4
    t.integer "organization_id", limit: 4
  end

  create_table "organization_technologies", force: :cascade do |t|
    t.integer "organization_id", limit: 4
    t.integer "technology_id",   limit: 4
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name",        limit: 255
    t.string "dates",       limit: 255
    t.string "position",    limit: 255
    t.string "location",    limit: 255
    t.text   "description", limit: 65535
  end

  create_table "project_organizations", force: :cascade do |t|
    t.integer "project_id",      limit: 4
    t.integer "organization_id", limit: 4
  end

  create_table "project_specialties", force: :cascade do |t|
    t.integer "project_id",   limit: 4
    t.integer "specialty_id", limit: 4
  end

  create_table "project_technologies", force: :cascade do |t|
    t.integer "project_id",    limit: 4
    t.integer "technology_id", limit: 4
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "rich_rich_files", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name",    limit: 255
    t.string   "rich_file_content_type", limit: 255
    t.integer  "rich_file_file_size",    limit: 4
    t.datetime "rich_file_updated_at"
    t.string   "owner_type",             limit: 255
    t.integer  "owner_id",               limit: 4
    t.text     "uri_cache",              limit: 65535
    t.string   "simplified_type",        limit: 255,   default: "file"
  end

  create_table "spark_tags", force: :cascade do |t|
    t.integer "tag_id",   limit: 4
    t.integer "spark_id", limit: 4
  end

  create_table "sparks", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "summary",      limit: 65535
    t.text     "dev_notes",    limit: 65535
    t.string   "direct_link",  limit: 255
    t.text     "canned_video", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "published",                  default: true
    t.text     "longform",     limit: 65535
    t.string   "video_url",    limit: 255
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "specialty_technologies", force: :cascade do |t|
    t.integer "specialty_id",  limit: 4
    t.integer "technology_id", limit: 4
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag", limit: 255
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
    t.string   "username",               limit: 255
    t.string   "session_token",          limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
