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

  create_table "deputados", force: :cascade do |t|
    t.integer "id_externo"
    t.string "nome_parlamentar"
    t.string "cpf"
    t.string "numero_carteira_parlamentar"
    t.integer "legislatura"
    t.string "sigla_uf"
    t.string "sigla_partido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "especificacao", force: :cascade do |t|
    t.integer "id_externo"
    t.integer "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gastos_deputados", force: :cascade do |t|
    t.integer "deputado_id", null: false
    t.integer "subcota_id", null: false
    t.integer "especificacao_id", null: false
    t.string "fornecedor"
    t.string "cpf_cnpj"
    t.string "numero_documento"
    t.string "tipo_documento_fiscal"
    t.date "data_emissao"
    t.decimal "valor_documento"
    t.decimal "valor_glosa"
    t.decimal "valor_liquido"
    t.integer "ano"
    t.integer "mes"
    t.integer "numero_parcela"
    t.string "passageiro"
    t.string "trecho"
    t.string "lote"
    t.string "numero_ressarcimento"
    t.string "valor_restituicao"
    t.string "id_solicitante"
    t.string "url_documento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deputado_id"], name: "index_gastos_deputados_on_deputado_id"
    t.index ["especificacao_id"], name: "index_gastos_deputados_on_especificacao_id"
    t.index ["subcota_id"], name: "index_gastos_deputados_on_subcota_id"
  end

  create_table "subcota", force: :cascade do |t|
    t.integer "id_externo"
    t.integer "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "gastos_deputados", "deputados"
  add_foreign_key "gastos_deputados", "especificacao"
  add_foreign_key "gastos_deputados", "subcota", column: "subcota_id"
end
