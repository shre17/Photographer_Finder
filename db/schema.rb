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

ActiveRecord::Schema.define(version: 20180420111003) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "photographers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photographers_id"], name: "index_albums_on_photographers_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "banner_image"
    t.integer "photographers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photographers_id"], name: "index_articles_on_photographers_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "message"
    t.integer "users_id"
    t.integer "articles_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["articles_id"], name: "index_comments_on_articles_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "membership_plans", force: :cascade do |t|
    t.string "name"
    t.string "price_per_six_months"
    t.string "feature_one"
    t.string "feature_two"
    t.string "feature_three"
    t.string "feature_four"
    t.string "feature_five"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photographer_membership_plans", force: :cascade do |t|
    t.integer "photographers_id"
    t.integer "membership_plans_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membership_plans_id"], name: "index_photographer_membership_plans_on_membership_plans_id"
    t.index ["photographers_id"], name: "index_photographer_membership_plans_on_photographers_id"
  end

  create_table "photographers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "last_name"
    t.string "contact"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.string "facebook_page_url"
    t.string "linkedin_page_url"
    t.string "google_plus_page_url"
    t.string "twitter_page_url"
    t.string "experience_of_photography"
    t.string "about"
    t.float "latitude"
    t.float "longitude"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_photographers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_photographers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "profile_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
