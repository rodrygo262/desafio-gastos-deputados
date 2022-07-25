class Especificacao < ApplicationRecord
  self.table_name = "especificacao"

  has_many :gastos_deputados

  #
  # Função utilizada na importação do arquivo CSV.
  # Insere ou retorna uma especificação presente no banco.
  # @params id_externo código externo da especificação
  # @params descricao descrição da especificação
  # @return Especificacao
  #
  def self.busca_insere_especificacao(id_externo, descricao)
    especificacao_new = Especificacao.find_or_initialize_by(
      id_externo: id_externo,
    )
    if especificacao_new.id.present?
      especificacao_new
    else
      especificacao_new.descricao = descricao
      if especificacao_new.save
        especificacao_new
      else
        raise "Erro ao inserir a subcota #{descricao}"
      end
    end
  end
end
