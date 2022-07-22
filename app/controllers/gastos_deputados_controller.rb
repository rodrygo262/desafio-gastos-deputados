class GastosDeputadosController < ApplicationController
  protect_from_forgery except: :upload
  before_action :set_gastos_deputado, only: %i[ show edit update destroy ]

  # GET /gastos_deputados or /gastos_deputados.json
  def index
    @gastos_deputados = GastosDeputado.all
  end

  # GET /gastos_deputados/1 or /gastos_deputados/1.json
  def show
  end

  def upload
    # parei aqui
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gastos_deputado
    @gastos_deputado = GastosDeputado.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gastos_deputado_params
    params.fetch(:gastos_deputado, {})
  end
end
