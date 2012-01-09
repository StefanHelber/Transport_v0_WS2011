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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120103150500) do

  create_table "sinks", :force => true do |t|
    t.string   "name"
    t.string   "codename"
    t.float    "demand_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "codename"
    t.float    "supply_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transport_links", :force => true do |t|
    t.integer  "source_id"
    t.integer  "sink_id"
    t.float    "unit_cost"
    t.float    "transport_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
