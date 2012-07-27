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

ActiveRecord::Schema.define(:version => 20120412060152) do

  create_table "accounts", :force => true do |t|
    t.string   "netid"
    t.string   "password"
    t.string   "name"
    t.string   "picture_url"
    t.string   "account_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "courseCode"
    t.string   "courseDescription"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "cy_clicker_settings", :force => true do |t|
    t.boolean  "studentsBlocked"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.string   "courseCode"
    t.string   "sectionNo"
    t.string   "studentID"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offerings", :force => true do |t|
    t.string   "courseCode"
    t.string   "sectionNo"
    t.string   "instructorID"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "polls", :force => true do |t|
    t.string   "courseCode"
    t.string   "name"
    t.boolean  "open"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_answers", :force => true do |t|
    t.integer  "questionID"
    t.integer  "number"
    t.string   "answerText"
    t.boolean  "correctAnswer"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "pollID"
    t.integer  "number"
    t.string   "questionText"
    t.string   "questionType"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "student_answers", :force => true do |t|
    t.string   "studentID"
    t.integer  "questionID"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
