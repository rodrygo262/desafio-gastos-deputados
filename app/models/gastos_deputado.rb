class GastosDeputado < ApplicationRecord
  belongs_to :deputado
  belongs_to :especificacao
  belongs_to :subcota
end
