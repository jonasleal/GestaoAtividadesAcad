class BibliografiaController < ApplicationController
  before_action :set_bibliografium, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  # GET /bibliografia
  # GET /bibliografia.json
  def index
    @projeto= Projeto.find(params[:projeto_id])
    @bibliografia=@projeto.bibliografia
  end

  # GET /bibliografia/1
  # GET /bibliografia/1.json
  def show
  end

  # GET /bibliografia/new
  def new
    @bibliografium = Bibliografium.new
    @projeto= Projeto.find(params[:projeto_id])
  end

  # GET /bibliografia/1/edit
  def edit
  end

  # POST /bibliografia
  # POST /bibliografia.json
  def create
    @projeto= Projeto.find(params[:projeto_id])
    @bibliografium = @projeto.bibliografia.create(bibliografium_params)
    respond_to do |format|
      #redirect_to projeto_path(@projeto)
      if @bibliografium.save
        format.html { redirect_to projeto_path(@projeto), notice: 'Bibliografia salva com sucesso.' }
        format.json { render :show, status: :created, location: @bibliografium }
      else
        format.html { render :new }
        format.json { render json: @bibliografium.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /bibliografia/1
  # PATCH/PUT /bibliografia/1.json
  def update
    respond_to do |format|
      if @bibliografium.update(bibliografium_params)
        format.html { redirect_to @bibliografium, notice: 'Bibliografia editada com sucesso.' }
        format.json { render :show, status: :ok, location: @bibliografium }
      else
        format.html { render :edit }
        format.json { render json: @bibliografium.errors, status: :unprocessable_entity }
      end

    end

  end

  # DELETE /bibliografia/1
  # DELETE /bibliografia/1.json
  def destroy
    @projeto = Projeto.find(params[:projeto_id])
    @bibliografium =  @projeto.bibliografia.find(params[:id])
    @bibliografium.destroy
    redirect_to projeto_path(@projeto)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bibliografium
      @bibliografium = Bibliografium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bibliografium_params
      params.require(:bibliografium).permit(:titulo,:descricao,:projeto_id,)
    end
end
