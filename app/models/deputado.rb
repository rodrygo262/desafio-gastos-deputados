class Deputado < ApplicationRecord
  attr_reader :total_gastos, :maior_despesa
  has_many :gastos_deputados

  def total_gastos
    @total_gastos ||= GastosDeputado.where(deputado_id: self.id).sum(:valor_liquido)
  end

  def maior_despesa
    @maior_despesa ||= GastosDeputado.where(deputado_id: self.id).order("valor_liquido desc").first
  end

  #
  # Função utilizada na importação do arquivo CSV
  # Busca o registro do deputado pelo id de cadastro externo, caso não exista, cria o mesmo.
  # @params linha_csv - linha do arquivo csv
  # @return Deputado
  #
  def self.busca_insere_deputado(linha_csv)
    deputado_new = Deputado.find_or_initialize_by(
      id_externo: linha_csv[:idecadastro],
    )
    if deputado_new.id.present?
      deputado_new
    else
      deputado_new.nome_parlamentar = linha_csv[:txnomeparlamentar]
      deputado_new.cpf = linha_csv[:cpf]
      deputado_new.numero_carteira_parlamentar = linha_csv[:nucarteiraparlamentar]
      deputado_new.legislatura = linha_csv[:nulegislatura]
      deputado_new.sigla_uf = linha_csv[:sguf]
      deputado_new.sigla_partido = linha_csv[:sgpartido]
      if deputado_new.save
        deputado_new
      else
        raise "Erro ao salvar o deputado #{linha_csv[:txnomeparlamentar]}"
      end
    end
  end
end
