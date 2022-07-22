class CreateGastosDeputados < ActiveRecord::Migration[6.0]
  def change
    create_table :subcota, id: :serial do |t|
      t.integer "id_externo"
      t.integer "descricao"
      t.timestamps
    end

    create_table :especificacao, id: :serial do |t|
      t.integer "id_externo"
      t.integer "descricao"
      t.timestamps
    end

    create_table :gastos_deputados, id: :serial do |t|
      t.references :deputado, null: false, foreign_key: true
      t.references :subcota, null: false, foreign_key: true
      t.references :especificacao, null: false, foreign_key: true

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
      t.timestamps
    end
  end
end
