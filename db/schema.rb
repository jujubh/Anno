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

ActiveRecord::Schema.define(:version => 20110130142250) do

  create_table "annotations", :force => true do |t|
    t.string   "name"
    t.integer  "document_id"
    t.string   "line"
    t.integer  "position"
    t.integer  "norm_id"
    t.integer  "lemma_id"
    t.integer  "partofspeech_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lemmas", :force => true do |t|
    t.string   "lemma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "norms", :force => true do |t|
    t.string   "norm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partofspeeches", :force => true do |t|
    t.string   "partofspeech"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", :force => true do |t|
    t.string   "token"
    t.integer  "annotation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
