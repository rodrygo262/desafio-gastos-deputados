FactoryBot.define do
  factory :deputado do
    id_externo { Faker::Number.digit }
    nome_parlamentar { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    numero_carteira_parlamentar { Faker::Number.number(digits: 3) }
    legislatura { Faker::Number.number(digits: 2) }
    sigla_uf { "MG" }
    sigla_partido { "PP" }
  end
end
