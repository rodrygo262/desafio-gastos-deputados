require "csv"

class GastosDeputado < ApplicationRecord
  belongs_to :deputado
  belongs_to :especificacao
  belongs_to :subcota

  #
  # Realiza a importação da base de gastos a partir de um arquivo CSV disponibilizado no link
  # https://dadosabertos.camara.leg.br/swagger/api.html#staticfile
  # @params arquivo - arquivo CSV
  #
  def self.realiza_importacao_base(arquivo)
    begin
      CSV.foreach(
        arquivo.try(:tempfile),
        {
          encoding: "bom|utf-8",
          headers: :first_row,
          header_converters: :symbol,
          col_sep: "\;",
        }
      ) do |linha|
        # Ignorar linhas que não tenham no campo sgUF o estado que você mora. O objetivo do trabalho é focar apenas no seu estado;
        if linha[:sguf].present? &&
           linha[:sguf].upcase == "MG"
          deputado_new = Deputado.busca_insere_deputado(linha)
          subcota_new = Subcota.busca_insere_subcota(
            linha[:numsubcota],
            linha[:txtdescricao]
          )
          especificacao_new = Especificacao.busca_insere_especificacao(
            linha[:numespecificacaosubcota],
            linha[:txtdescricaoespecificacao]
          )

          gasto_new = GastosDeputado.find_or_initialize_by(
            numero_documento: linha[:txtnumero],
            tipo_documento_fiscal: linha[:indtipodocumento],
            data_emissao: linha[:datemissao],
          )
          gasto_new.deputado_id ||= deputado_new.id
          gasto_new.subcota_id ||= subcota_new.id
          gasto_new.especificacao_id ||= especificacao_new.id
          gasto_new.fornecedor ||= linha[:txtfornecedor]
          gasto_new.cpf_cnpj ||= linha[:txtcnpjcpf]
          gasto_new.valor_documento ||= linha[:vlrdocumento]
          gasto_new.valor_glosa ||= linha[:vlrglosa]
          gasto_new.valor_liquido ||= linha[:vlrliquido]
          gasto_new.ano ||= linha[:numano]
          gasto_new.mes ||= linha[:nummes]
          gasto_new.numero_parcela ||= linha[:numparcela]
          gasto_new.passageiro ||= linha[:txtpassageiro]
          gasto_new.trecho ||= linha[:txttrecho]
          gasto_new.lote ||= linha[:numlote]
          gasto_new.numero_ressarcimento ||= linha[:numressarcimento]
          gasto_new.valor_restituicao ||= linha[:vlrrestituicao]
          gasto_new.id_solicitante ||= linha[:nudeputadoid]
          gasto_new.url_documento ||= linha[:urldocumento]
          unless gasto_new.save
            raise "Erro ao inserir gasto"
          end
        end
      end
      true
    rescue => exception
      false
    end
  end
end
