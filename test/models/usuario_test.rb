require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'criar usuario valido' do
    usuario = Usuario.new email: 'jose34@.gmail.com', senha: 'senhaValida12', nome: 'jose matias', cpf: '00000000000', curso: 'BCC', especificao: 'professor'
    assert usuario.save
  end

  test 'nao editar usuario com e-mail em branco' do
    usuario = Usuario.new email: 'jose34@.gmail.com', senha: 'senhaValida12', nome: 'jose matias', cpf: '00000000000', curso: 'BCC', especificao: 'professor'
    assert usuario.save
    assert_not usuario.update email: ''
  end
end
