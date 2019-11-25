class ReuniaosController < ApplicationController
  before_action :set_reuniao, only: [:show, :edit, :update, :destroy]

  # GET /reuniaos
  # GET /reuniaos.json
  def index
    @reuniaos = Reuniao.all
  end

  # GET /reuniaos/1
  # GET /reuniaos/1.json
  def show
  end

  # GET /reuniaos/new
  def new
    @reuniao = Reuniao.new
  end

  # GET /reuniaos/1/edit
  def edit
  end

  # POST /reuniaos
  # POST /reuniaos.json
  def create
    @reuniao = Reuniao.new(reuniao_params)

    respond_to do |format|
      if @reuniao.save
        format.html { redirect_to @reuniao, notice: 'Reuniao was successfully created.' }
        format.json { render :show, status: :created, location: @reuniao }
      else
        format.html { render :new }
        format.json { render json: @reuniao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reuniaos/1
  # PATCH/PUT /reuniaos/1.json
  def update
    respond_to do |format|
      if @reuniao.update(reuniao_params)
        format.html { redirect_to @reuniao, notice: 'Reuniao was successfully updated.' }
        format.json { render :show, status: :ok, location: @reuniao }
      else
        format.html { render :edit }
        format.json { render json: @reuniao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reuniaos/1
  # DELETE /reuniaos/1.json
  def destroy
    @reuniao.destroy
    respond_to do |format|
      format.html { redirect_to reuniaos_url, notice: 'Reuniao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reuniao
      @reuniao = Reuniao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reuniao_params
      params.fetch(:reuniao, {})
    end
end
