FactoryBot.define do
  factory :subcota do
    id_externo { Faker::Number.digit }
    descricao { Faker::Restaurant.name }
  end
end
