class GastosDeputadosController < ApplicationController
  protect_from_forgery except: :upload
  before_action :set_gastos_deputado, only: %i[ show edit update destroy ]
  before_action :set_new_gastos_deputado, only: [:upload]

  # GET /gastos_deputados or /gastos_deputados.json
  def index
    @deputados = Deputado.all
  end

  # GET /gastos_deputados/1 or /gastos_deputados/1.json
  def show
  end

  def upload
    if GastosDeputado.realiza_importacao_base(
      params[:arquivo_importacao]
    )
      render json: nil, status: :created
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  private

  def set_new_gastos_deputado
    @gastos_deputados = GastosDeputado.new
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_gastos_deputado
    @gastos_deputado = GastosDeputado.where(deputado_id: params[:id]).order(:data_emissao)
    @deputado = Deputado.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gastos_deputado_params
    params.fetch(:gastos_deputado, {})
  end
end
