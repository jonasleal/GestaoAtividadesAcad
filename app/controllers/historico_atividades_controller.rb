class HistoricoAtividadesController < ApplicationController
  before_action :set_historico_atividade, only: [:show, :edit]

  # GET /historico_atividades
  # GET /historico_atividades.json
  def index
    @historico_atividades = HistoricoAtividade.all
  end

  # GET /historico_atividades/1
  # GET /historico_atividades/1.json
  def show
  end

  # GET /historico_atividades/new
  def new
    @historico_atividade = HistoricoAtividade.new
  end

  # GET /historico_atividades/1/edit
  def edit
  end

  # POST /historico_atividades
  # POST /historico_atividades.json
  def create
    @atividade =Atividade.find(params[:atividade_id])
    @historico_atividade =  @atividade.historico_atividades.create(historico_atividade_params)
    if @historico_atividade.save
      redirect_to atividade_path(@atividade), {notice: ' status was successfully created.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_atividade
      @historico_atividade = HistoricoAtividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historico_atividade_params
      params.require(:historico_atividade).permit(:status,:atividade_id)
    end
end
