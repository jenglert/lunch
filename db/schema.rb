# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110205204458) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "url_key"
    t.datetime "when"
    t.integer  "organizer_id"
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.decimal  "radius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lunch_option_categories", :force => true do |t|
    t.string   "name"
    t.integer  "lunch_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lunch_options", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.decimal  "distance"
    t.string   "photo_url"
    t.decimal  "avg_rating"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "photo_url_small"
    t.boolean  "is_closed"
    t.integer  "event_id"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "cookie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
