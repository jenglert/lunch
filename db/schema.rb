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

ActiveRecord::Schema.define(:version => 20110305021711) do

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

  create_table "lunch_option_reviews", :force => true do |t|
    t.string   "yelp_id"
    t.string   "text_excerpt"
    t.string   "url"
    t.string   "user_name"
    t.string   "user_photo_url"
    t.string   "user_photo_url_small"
    t.decimal  "rating"
    t.string   "mobile_url"
    t.string   "user_url"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lunch_option_id"
    t.string   "rating_img_url"
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
    t.string   "rating_img_url_small"
    t.integer  "review_count"
  end

  add_index "lunch_options", ["event_id", "link"], :name => "lunchoption_event_id_link_uidx", :unique => true

  create_table "request_logs", :force => true do |t|
    t.text     "body"
    t.integer  "response_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "cookie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lunch_option_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yelp_categories", :force => true do |t|
    t.string   "name"
    t.string   "key"
    t.integer  "parent_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "excluded"
  end

end
