class Especificacao < ApplicationRecord
  self.table_name = "especificacao"

  has_many :gastos_deputados
end
