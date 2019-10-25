require 'test_helper'

class TrabalhoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'criar trabalho valido' do
    usuario = Usuario.new email: 'jose34@gmail.com', senha: 'senhaValida12', nome: 'jose matias', cpf: '00000000000', curso: 'BCC', especificao: 'professor'
    assert usuario.save

    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save

    trabalho=Trabalho.new funcao:"Estudante",projeto_id:projeto.id,usuario_id:usuario.id
    assert trabalho.save
  end
  test 'remover trabalho valido' do
    usuario = Usuario.new email: 'jose34@gmail.com', senha: 'senhaValida12', nome: 'jose matias', cpf: '00000000000', curso: 'BCC', especificao: 'professor'
    assert usuario.save

    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save

    trabalho=Trabalho.new funcao:"Estudante",projeto_id:projeto.id,usuario_id:usuario.id
    assert trabalho.save
    assert trabalho.destroy
  end
end
