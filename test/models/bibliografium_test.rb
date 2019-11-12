require 'test_helper'

class BibliografiumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'criar bibliografia valida' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
    bibliografia = Bibliografium.new titulo: "teste", descricao: "teste", projeto_id:projeto.id
    assert bibliografia.save
  end

  test 'criar bibliografia com titulo em branco' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
    bibliografia = Bibliografium.new titulo: "", descricao: "teste", projeto_id:projeto.id
    assert_not bibliografia.save
  end

  test 'criar bibliografia com descricao sem minimo de caracteres' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
    bibliografia = Bibliografium.new titulo: "teste", descricao: "13", projeto_id:projeto.id
    assert_not bibliografia.save
  end

  test 'remover bibliografia' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
    bibliografia = Bibliografium.new titulo: "teste", descricao: "teste", projeto_id:projeto.id
    assert bibliografia.save
    assert bibliografia.destroy
  end
end
