class HistoricoAtividadesController < ApplicationController
  before_action :set_historico_atividade, only: [:show, :edit, :update, :destroy]

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
    @historico_atividade = HistoricoAtividade.new(historico_atividade_params)

    respond_to do |format|
      if @historico_atividade.save
        format.html { redirect_to @historico_atividade, notice: 'Historico atividade was successfully created.' }
        format.json { render :show, status: :created, location: @historico_atividade }
      else
        format.html { render :new }
        format.json { render json: @historico_atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historico_atividades/1
  # PATCH/PUT /historico_atividades/1.json
  def update
    respond_to do |format|
      if @historico_atividade.update(historico_atividade_params)
        format.html { redirect_to @historico_atividade, notice: 'Historico atividade was successfully updated.' }
        format.json { render :show, status: :ok, location: @historico_atividade }
      else
        format.html { render :edit }
        format.json { render json: @historico_atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historico_atividades/1
  # DELETE /historico_atividades/1.json
  def destroy
    @historico_atividade.destroy
    respond_to do |format|
      format.html { redirect_to historico_atividades_url, notice: 'Historico atividade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_atividade
      @historico_atividade = HistoricoAtividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historico_atividade_params
      params.require(:historico_atividade).permit(:status)
    end
end
