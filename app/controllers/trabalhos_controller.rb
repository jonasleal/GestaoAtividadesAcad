class TrabalhosController < ApplicationController
  before_action :set_trabalho, only: [:show,:index, :destroy]
  before_action :authenticate_usuario!

  def index
    @projeto= Projeto.find(params[:projeto_id])
    @trabalhos=@projeto.trabalhos
  end

  def show
  end

  # GET /bibliografia/new
  def new
    @trabalho= Trabalho.new
    @projeto= Projeto.find(params[:projeto_id])
  end

  def create
    @projeto = Projeto.find(params[:projeto_id])
    @trabalho =  @projeto.trabalhos.create(trabalho_params)

    if @trabalho.save
      format.html { redirect_to projeto_path(@projeto), notice:'Integrande foi adicionado com sucesso.'  }
      format.json { render :show, status: :created, location: @projeto }
    else
      format.html { render :new }
      format.json { render json: @trabalho.errors, status: :unprocessable_entity }
    end
  end


  def destroy
    @projeto = Projeto.find(params[:projeto_id])
    @trabalho=@projeto.trabalhos.find(params[:id])
    @trabalho.destroy
     redirect_to projeto_path(@projeto)
  end
  private
  def set_trabalho
    @projeto= Projeto.find(params[:projeto_id])
    @trabalho= Trabalho.find(@projeto.id)
  end
  def trabalho_params
    params.require(:trabalho).permit(:funcao, :projeto_id, :usuario_id)
  end
end
