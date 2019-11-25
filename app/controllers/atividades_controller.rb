class AtividadesController < ApplicationController
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /atividades
  # GET /atividades.json
  def index
    @projeto= Projeto.find(params[:projeto_id])
    @atividades=@projeto.atividades
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
    @projeto= Projeto.find(params[:projeto_id])
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  # POST /atividades.json
  def create

    @projeto = Projeto.find(params[:projeto_id])

    @atividade = @projeto.atividades.create(atividade_params)

    @atividade.cargaReal= 0
    # redirect_to projeto_path(@projeto)
    respond_to do |format|
      if @atividade.save
        format.html { redirect_to projeto_path(@projeto), notice: 'Atividade was successfully created.' }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1
  # PATCH/PUT /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade, notice: 'Atividade was successfully updated.' }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @projeto = Projeto.find(params[:projeto_id])
    @atividade = @projeto.atividades.find(params[:id])
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to projeto_path(@projeto), notice: 'Atividade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_atividade
    @atividade = Atividade.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def atividade_params
    params.require(:atividade).permit(:titulo, :dataInicio, :dataFim, :cargaPrev, :cargaReal, :descricao,:projeto_id)
  end
end
