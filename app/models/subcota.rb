class Subcota < ApplicationRecord
  has_many :gastos_deputados

  #
  # Função utilizada na importação do arquivo CSV.
  # Insere ou retorna uma subcota presente no banco.
  # @params id_externo código externo da subcota
  # @params descricao descrição da subcota
  # @return Subcota
  #
  def self.busca_insere_subcota(id_externo, descricao)
    subcota_new = Subcota.find_or_initialize_by(
      id_externo: id_externo,
    )
    if subcota_new.id.present?
      subcota_new
    else
      subcota_new.descricao = descricao
      if subcota_new.save
        subcota_new
      else
        raise "Erro ao inserir a subcota #{descricao}"
      end
    end
  end
end
