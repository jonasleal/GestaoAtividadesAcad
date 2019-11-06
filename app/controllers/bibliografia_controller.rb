class BibliografiaController < ApplicationController
  before_action :set_bibliografium, only: [:show, :edit, :update, :destroy]

  # GET /bibliografia
  # GET /bibliografia.json
  def index
    @bibliografia = Bibliografium.all
  end

  # GET /bibliografia/1
  # GET /bibliografia/1.json
  def show
  end

  # GET /bibliografia/new
  def new
    @bibliografium = Bibliografium.new
  end

  # GET /bibliografia/1/edit
  def edit
  end

  # POST /bibliografia
  # POST /bibliografia.json
  def create
    @bibliografium = Bibliografium.new(bibliografium_params)

    respond_to do |format|
      if @bibliografium.save
        format.html { redirect_to @bibliografium, notice: 'Bibliografium was successfully created.' }
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
        format.html { redirect_to @bibliografium, notice: 'Bibliografium was successfully updated.' }
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
    @bibliografium.destroy
    respond_to do |format|
      format.html { redirect_to bibliografia_url, notice: 'Bibliografium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bibliografium
      @bibliografium = Bibliografium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bibliografium_params
      params.require(:bibliografium).permit(:titulo, :descricao)
    end
end
