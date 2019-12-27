# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_20_034141) do

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.boolean "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journal_entries", force: :cascade do |t|
    t.date "accrued"
    t.string "item"
    t.integer "transaction_category1_id"
    t.integer "transaction_category2_id"
    t.integer "cents"
    t.boolean "inverted"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_category1_id"], name: "index_journal_entries_on_transaction_category1_id"
    t.index ["transaction_category2_id"], name: "index_journal_entries_on_transaction_category2_id"
  end

  create_table "transaction_categories", force: :cascade do |t|
    t.string "name"
    t.integer "account_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_type_id"], name: "index_transaction_categories_on_account_type_id"
  end

  add_foreign_key "journal_entries", "transaction_categories", column: "transaction_category1_id"
  add_foreign_key "journal_entries", "transaction_categories", column: "transaction_category2_id"
  add_foreign_key "transaction_categories", "account_types"
end
