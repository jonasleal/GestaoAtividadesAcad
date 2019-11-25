require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'criar usuario valido' do
    usuario = Usuario.new email: 'jose12@gmail.com', password: 'senhaValida12', nome: 'jose matias', cpf: '809.098.098-00', curso: 'BCC'
    assert usuario.save
  end

  test 'nao editar usuario com e-mail em branco' do
    usuario = Usuario.new email: 'jose34@gmail.com', password: 'senhaValida12', nome: 'jose matias', cpf: '809.098.098-00', curso: 'BCC'
    assert usuario.save
    assert_not usuario.update email: ''
  end

  test 'editar usuario com senha valida' do
    usuario = Usuario.new email: 'jose34@gmail.com', password: 'senhaValida12', nome: 'jose matias', cpf: '809.098.098-00', curso: 'BCC'
    assert usuario.save
    assert usuario.update password: 'meuCursoBCC'
  end

  test 'nao criar usuario invalido' do
    usuario = Usuario.new email: 'jose34@gmail.com', password: 'senhaValida12', nome: 'jose matias@@@@', cpf: '809.098.098-00', curso: 'BCC'
    assert_not usuario.save
  end
end
