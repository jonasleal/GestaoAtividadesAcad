require 'test_helper'

class ProjetoTest < ActiveSupport::TestCase
  test 'criar projeto valido' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
  end
  test 'nao editar projeto com titulo em branco' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
    assert_not projeto.update titulo: ''
  end
  test 'nao criar projeto com titulo em branco' do
    projeto= Projeto.new titulo:'', area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert_not projeto.save
    end
  test 'remover projeto existente ' do
    projeto= Projeto.new titulo:"Gestao de projeto", area:"Informatica", dataFin:"20/10/2020", dataInicio:"20/10/2019", tipoProjeto:"tcc"
    assert projeto.save
    assert projeto.destroy
  end
end
