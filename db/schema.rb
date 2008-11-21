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

ActiveRecord::Schema.define(:version => 20081121115018) do

  create_table "bills", :force => true do |t|
    t.string   "code"
    t.date     "written_on"
    t.string   "customer_name"
    t.string   "subject"
    t.string   "payment_condition"
    t.date     "payment_due_date"
    t.text     "bank"
    t.text     "from"
    t.integer  "total_amount"
    t.integer  "tax"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
