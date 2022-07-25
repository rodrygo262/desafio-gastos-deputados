FactoryBot.define do
  factory :especificacao do
    id_externo { Faker::Number.digit }
    descricao { Faker::Restaurant.name }
  end
end
