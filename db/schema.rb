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

ActiveRecord::Schema.define(version: 20160120135250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "ltree"

  create_table "comments", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.text     "body"
    t.string   "ip"
    t.boolean  "is_hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.ltree    "tree"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",                        null: false
    t.text     "body",                         null: false
    t.string   "source",                       null: false
    t.boolean  "is_published", default: false, null: false
    t.integer  "version",      default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "email",                                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "login_count",                     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.boolean  "is_admin",                        default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "deleted_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
