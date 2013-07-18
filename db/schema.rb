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

ActiveRecord::Schema.define(version: 20130718032017) do

  create_table "answers", force: true do |t|
    t.text     "answer",         limit: 255
    t.integer  "participant_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["participant_id"], name: "index_answers_on_participant_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "contests", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "cstatus"
    t.string   "ctype"
    t.string   "name"
    t.string   "headine"
    t.string   "banner_path"
    t.string   "background_path"
    t.integer  "theme_id"
    t.boolean  "only_follwers"
    t.string   "owner_screen_name"
    t.string   "owner_twitter_token"
    t.string   "owner_twitter_secret"
    t.string   "owner_facebook_id"
    t.string   "owner_facebook_token"
    t.string   "owner_facebook_secret"
    t.integer  "min_followers_count"
    t.datetime "min_twitter_start_date"
    t.integer  "min_status_count"
    t.string   "message_to_tweet"
    t.string   "message_to_fb"
    t.boolean  "tweet_required"
    t.boolean  "fb_required"
    t.integer  "max_entries"
    t.boolean  "accept_multiple",        limit: 255
    t.string   "rules"
    t.string   "timezone"
    t.float    "prize_worth"
    t.string   "prize_currency"
    t.text     "prize_detail",           limit: 255
    t.string   "language"
    t.boolean  "show_winners"
    t.boolean  "show_winner_answer"
    t.text     "over_message",           limit: 255
    t.string   "send_email_to"
    t.string   "completion_msg"
    t.integer  "organization_id"
    t.integer  "user_id"
    t.string   "deleted_user_name"
    t.text     "answer_filter",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["organization_id"], name: "index_contests_on_organization_id"
  add_index "contests", ["theme_id"], name: "index_contests_on_theme_id"

  create_table "coupons", force: true do |t|
    t.string   "code"
    t.integer  "organization_id"
    t.string   "comment"
    t.string   "ctype"
    t.datetime "expire_at"
    t.string   "discount_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "some_id"
    t.string   "ltype"
    t.string   "detail"
    t.string   "ip_address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["user_id"], name: "index_logs_on_user_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "otype"
    t.string   "ostatus"
    t.integer  "premium_contest_count"
    t.integer  "sub_premium_contest_count"
    t.datetime "subscription_starts_at"
    t.datetime "subscription_expires_at"
    t.integer  "subscription_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["subscription_id"], name: "index_organizations_on_subscription_id"

  create_table "participants", force: true do |t|
    t.integer  "contest_id"
    t.integer  "twitter_user_id"
    t.string   "ip"
    t.string   "country"
    t.string   "state"
    t.string   "browser"
    t.integer  "num_of_q_answered"
    t.boolean  "has_tweeted"
    t.boolean  "posted_on_fb"
    t.string   "pstatus"
    t.boolean  "is_winner"
    t.string   "winner_tag"
    t.string   "winner_note"
    t.datetime "winner_at"
    t.string   "referrer"
    t.boolean  "multiple_entered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["contest_id"], name: "index_participants_on_contest_id"
  add_index "participants", ["twitter_user_id"], name: "index_participants_on_twitter_user_id"

  create_table "payments", force: true do |t|
    t.float    "amount_paid"
    t.integer  "plan_id"
    t.integer  "quantity"
    t.float    "amount_returned"
    t.float    "total_to_pay"
    t.float    "discount"
    t.string   "gateway_id"
    t.string   "payment_meta_data"
    t.string   "comment"
    t.string   "pstatus"
    t.integer  "organization_id"
    t.integer  "coupon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["coupon_id"], name: "index_payments_on_coupon_id"
  add_index "payments", ["organization_id"], name: "index_payments_on_organization_id"

  create_table "questions", force: true do |t|
    t.string   "question"
    t.integer  "qorder"
    t.string   "qtype"
    t.boolean  "must_answer"
    t.text     "ans_1",       limit: 255
    t.text     "ans_2",       limit: 255
    t.text     "ans_3",       limit: 255
    t.text     "ans_4",       limit: 255
    t.text     "ans_5",       limit: 255
    t.text     "ans_6",       limit: 255
    t.text     "ans_7",       limit: 255
    t.text     "ans_8",       limit: 255
    t.text     "ans_9",       limit: 255
    t.text     "ans_10",      limit: 255
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["contest_id"], name: "index_questions_on_contest_id"

  create_table "subscriptions", force: true do |t|
    t.string   "name"
    t.string   "detail"
    t.float    "amount"
    t.string   "sstatus"
    t.string   "stype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "summaries", force: true do |t|
    t.integer  "views"
    t.integer  "pcount"
    t.datetime "time_at"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "summaries", ["contest_id"], name: "index_summaries_on_contest_id"

  create_table "themes", force: true do |t|
    t.string   "name"
    t.string   "folder"
    t.integer  "organization_id"
    t.string   "tstatus"
    t.string   "ttype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_users", force: true do |t|
    t.string   "screen_name"
    t.integer  "num_of_followers"
    t.integer  "num_of_followings"
    t.integer  "num_of_statuses"
    t.datetime "twitter_start_date"
    t.string   "avatar_url"
    t.string   "twitter_visibiity"
    t.string   "facebook_name"
    t.boolean  "update_it"
    t.integer  "klout_score"
    t.integer  "socont_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", force: true do |t|
    t.text     "message",    limit: 255
    t.string   "utype"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["contest_id"], name: "index_updates_on_contest_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "utype"
    t.string   "ustatus"
    t.string   "last_login_ip"
    t.datetime "last_login_at"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id"

end
