require 'test_helper'

class BibliografiaControllerTest < ActionDispatch::IntegrationTest
  /setup do
    @bibliografium = bibliografia(:one)
  end

  test "should get index" do
    get bibliografia_url
    assert_response :success
  end

  test "should get new" do
    get new_bibliografium_url
    assert_response :success
  end

  test "should create bibliografium" do
    assert_difference('Bibliografium.count') do
      post bibliografia_url, params: { bibliografium: { descricao: @bibliografium.descricao, titulo: @bibliografium.titulo } }
    end

    assert_redirected_to bibliografium_url(Bibliografium.last)
  end

  test "should show bibliografium" do
    get bibliografium_url(@bibliografium)
    assert_response :success
  end

  test "should get edit" do
    get edit_bibliografium_url(@bibliografium)
    assert_response :success
  end

  test "should update bibliografium" do
    patch bibliografium_url(@bibliografium), params: { bibliografium: { descricao: @bibliografium.descricao, titulo: @bibliografium.titulo } }
    assert_redirected_to bibliografium_url(@bibliografium)
  end

  test "should destroy bibliografium" do
    assert_difference('Bibliografium.count', -1) do
      delete bibliografium_url(@bibliografium)
    end

    assert_redirected_to bibliografia_url
  end/
end
