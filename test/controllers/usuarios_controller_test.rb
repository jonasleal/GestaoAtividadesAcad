require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  /setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_url
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post usuarios_url, params: { usuario: { cpf: '809.098.098-00', curso: 'BCC', email: 'jose34@.gmail.com', especificao: 'Professor Colaborador', nome: 'jose matias', senha: 'senhaValida12' } }
    end

    assert_redirected_to usuario_url(Usuario.last)
  end

  test "should show usuario" do
    get usuario_url(@usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_usuario_url(@usuario)
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: { usuario: { cpf: '809.098.098-00', curso: 'BCC', email: 'jose34@.gmail.com', especificao: 'Professor Colaborador', nome: 'jose matias', senha: 'senhaValida12' } }
    assert_redirected_to usuario_url(@usuario)
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete usuario_url(@usuario)
    end

    assert_redirected_to usuarios_url
  /
end
