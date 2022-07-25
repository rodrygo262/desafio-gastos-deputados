FactoryBot.define do
  factory :gastos_deputado do
    transient do
      deputado
      especificacao
      subcota
    end

    deputado_id { deputado.id }
    especificacao_id { especificacao.id }
    subcota_id { subcota.id }
  end
end
