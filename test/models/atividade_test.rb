require 'test_helper'

class AtividadeTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end
  test 'criar atividade valida' do
    projeto= Projeto.new titulo:'Gestao de projeto', area:'Informatica', dataFin:'20/10/2020',
                         dataInicio:'20/10/2019', tipoProjeto:'tcc'
    assert projeto.save
    atividade=Atividade.new titulo:'primeira atividade',dataInicio:'20/10/2020',dataFim:'20/10/2020',cargaPrev:'10',
                            cargaReal:'0',descricao:'nova atividade',projeto_id:projeto.id

    assert atividade.save
  end
  test 'tentar criar atividade com titulo em branco' do
    projeto= Projeto.new titulo:'Gestao de projeto', area:'Informatica', dataFin:'20/10/2020',
                         dataInicio:'20/10/2019', tipoProjeto:'tcc'
    atividade=Atividade.new titulo:'',dataInicio:'20/10/2019',dataFim:'20/10/2020',cargaPrev:10,
                            cargaReal:15,descricao:'nova atividade',projeto_id:projeto.id

    assert_not atividade.save
  end
  test 'tentar criar atividade com data inicio depos que data fim' do
    projeto= Projeto.new titulo:'Gestao de projeto', area:'Informatica', dataFin:'20/10/2020',
                         dataInicio:'20/10/2019', tipoProjeto:'tcc'
    atividade=Atividade.new titulo:'',dataInicio:"20/10/2019",dataFim:"20/10/2020",cargaPrev:10,
                            cargaReal:15,descricao:"nova atividade",projeto_id:projeto.id

    assert_not atividade.save
  end
  test 'tentar editar atividade com carga horaria prevista com caracteres especiais' do
    projeto= Projeto.new titulo:'Gestao de projeto', area:'Informatica', dataFin:'20/10/2020',
                         dataInicio:'20/10/2019', tipoProjeto:'tcc'
    atividade=Atividade.new titulo:"",dataInicio:"20/10/2019",dataFim:"20/10/2015",cargaPrev:"@@",
                            cargaReal:15,descricao:"nova atividade",projeto_id:projeto.id

    assert_not atividade.save
  end
end
