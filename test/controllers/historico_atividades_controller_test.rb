require 'test_helper'

class HistoricoAtividadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historico_atividade = historico_atividades(:one)
  end

  test "should get index" do
    get historico_atividades_url
    assert_response :success
  end

  test "should get new" do
    get new_historico_atividade_url
    assert_response :success
  end

  test "should create historico_atividade" do
    assert_difference('HistoricoAtividade.count') do
      post historico_atividades_url, params: { historico_atividade: { status: @historico_atividade.status } }
    end

    assert_redirected_to historico_atividade_url(HistoricoAtividade.last)
  end

  test "should show historico_atividade" do
    get historico_atividade_url(@historico_atividade)
    assert_response :success
  end

  test "should get edit" do
    get edit_historico_atividade_url(@historico_atividade)
    assert_response :success
  end

  test "should update historico_atividade" do
    patch historico_atividade_url(@historico_atividade), params: { historico_atividade: { status: @historico_atividade.status } }
    assert_redirected_to historico_atividade_url(@historico_atividade)
  end

  test "should destroy historico_atividade" do
    assert_difference('HistoricoAtividade.count', -1) do
      delete historico_atividade_url(@historico_atividade)
    end

    assert_redirected_to historico_atividades_url
  end
end
