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
end
