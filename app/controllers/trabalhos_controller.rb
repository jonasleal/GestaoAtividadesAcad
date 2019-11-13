class TrabalhosController < ApplicationController
  def create
    @projeto = Projeto.find(params[:projeto_id])
    @trabalho =  @projeto.trabalhos.create(trabalho_params)

    if @trabalho.save
      redirect_to projeto_path(@projeto), {notice: 'Trabalho was successfully created.' }
    else
      redirect_to projeto_path(@projeto),{notice:@trabalho.errors}
    end
  end

  #def destroy
  #  @projeto = Projeto.find(params[:projeto_id])
   # @trabalho=@projeto.trabalhos.find(params[:id])
   # @trabalho.destroy
   # redirect_to projeto_path(@projeto)
  #end
  private
  def trabalho_params
    params.require(:trabalho).permit(:funcao, :projeto_id, :usuario_id)
  end
end
