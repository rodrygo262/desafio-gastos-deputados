class CreateDeputados < ActiveRecord::Migration[6.0]
  def change
    create_table :deputados do |t|
      t.integer "id_externo", null: false
      t.string "nome_parlamentar", null: false
      t.string "cpf"
      t.string "numero_carteira_parlamentar"
      t.integer "legislatura"
      t.string "sigla_uf"
      t.string "sigla_partido"
      t.timestamps
    end
  end
end
