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

ActiveRecord::Schema.define(version: 2022_07_22_192804) do

# Could not dump table "deputados" because of following StandardError
#   Unknown type 'serial' for column 'id'

# Could not dump table "especificacao" because of following StandardError
#   Unknown type 'serial' for column 'id'

# Could not dump table "gastos_deputados" because of following StandardError
#   Unknown type 'serial' for column 'id'

# Could not dump table "subcota" because of following StandardError
#   Unknown type 'serial' for column 'id'

  add_foreign_key "gastos_deputados", "deputados"
  add_foreign_key "gastos_deputados", "especificacaos"
  add_foreign_key "gastos_deputados", "subcota", column: "subcota_id"
end
