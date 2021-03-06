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

ActiveRecord::Schema.define(version: 2020_02_16_142440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "starter_id"
    t.bigint "main_id"
    t.bigint "dessert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dessert_id"], name: "index_menus_on_dessert_id"
    t.index ["main_id"], name: "index_menus_on_main_id"
    t.index ["starter_id"], name: "index_menus_on_starter_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "recipe_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "categorie"
    t.integer "difficulty"
    t.integer "prep_time"
    t.integer "cooking_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "menus", "recipes", column: "dessert_id"
  add_foreign_key "menus", "recipes", column: "main_id"
  add_foreign_key "menus", "recipes", column: "starter_id"
end
