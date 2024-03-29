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

ActiveRecord::Schema.define(version: 20140305212116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "emails", force: true do |t|
    t.integer "tenant_id"
    t.integer "lead_id"
    t.integer "user_id"
    t.string  "subject"
    t.text    "body"
  end

  create_table "leads", force: true do |t|
    t.integer  "tenant_id",  null: false
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: true do |t|
    t.string   "uuid",       null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tenants", ["uuid"], name: "index_tenants_on_uuid", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer  "tenant_id",    null: false
    t.string   "email",        null: false
    t.string   "account_type"
    t.string   "name"
    t.string   "avatar_url"
    t.string   "profile_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["tenant_id", "email"], name: "index_users_on_tenant_id_and_email", unique: true, using: :btree

end
