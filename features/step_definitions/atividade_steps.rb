Given('O projeto com titulo {string} existe') do |titulo|
  criarProjeto(titulo, 'area', 'tipo', Date.current.strftime('%Y/%B/%d/'), (Date.current + 1.month).strftime('%Y/%B/%d/'))
end

def criarProjeto(titulo, area, tipo, dataInicio, dataFim)
  visit '/projetos/new'
  fill_in 'projeto[titulo]', with: titulo
  fill_in 'projeto[area]', with: area
  fill_in 'projeto[tipoProjeto]', with: tipo
  select_date(dataInicio,:from => 'Data de inicio')
  select_date(dataFim,:from => "Data de termino")
  click_button 'Criar projeto'
  expect(page).to have_content(titulo)

end

def criarAtividade(tituloProj,tituloAtiv, dataInicio, dataFim,cargaPrev, descricao)
  visit '/projetos'
  click_link "s-#{tituloProj}"
  expect(page).to have_content('Adicionando Atividades:')
  fill_in 'atividade[titulo]', with: tituloAtiv
  select_date(dataInicio,:from => 'Data de inicio')
  select_date(dataFim,:from => "Data de termino")
  fill_in 'atividade[cargaPrev]', with: cargaPrev
  fill_in 'atividade[descricao]', with: descricao
  click_button 'adcAtividade'
  expect(page).to have_content(tituloAtiv)
end

When('Eu visualizo o Projeto com titulo {string}') do |titulo|
  visit '/projetos/'
  click_link "s-#{titulo}"
  expect(page).to have_content('Adicionando Atividades:')
end

And('apreencho o campo Titulo de atividade com {string}') do |titulo|
  fill_in 'atividade[titulo]', with: titulo
end

And('data de inicio da ativade com {string}') do|dataInicio|
  data = Date.strptime(dataInicio, '%d/%m/%Y')
  strData = data.strftime('%Y/%B/%d/')
  select_date(strData,:from => 'Data de inicio')
end

And('data de termino da atividade com {string}') do |dataFim|
  data = Date.strptime(dataFim, '%d/%m/%Y')
  strData = data.strftime('%Y/%B/%d/')
  select_date(strData,:from => 'Data de termino')
end

And('carga prevista da atividade com {string}') do |cargaPrev|
  fill_in 'atividade[cargaPrev]', with: cargaPrev
end

And('descrição da atividade com {string}') do |descricao|
  fill_in 'atividade[descricao]', with: descricao
end

And('clico no botão Adicionar') do
  click_button 'adcAtividade'
end

Then('Eu vejo que a atividade com titulo {string} foi criado') do |titulo|
  expect(page).to have_content(titulo)
end

And('no projeto {string} a atividade com titulo {string} existe') do |tituloProj, tituloAtiv|
  criarAtividade(tituloProj,tituloAtiv,(Date.current + 1.day).strftime('%Y/%B/%d/'),
                 (Date.current + 10.day).strftime('%Y/%B/%d/'), "10", "Entrega da primeira atividade")

end

When('clico em editar da atividade com titulo {string}') do |titulo|
  click_link "e-#{titulo}"
end

And('clico no botão atualizar') do
  click_button 'atuAtividade'
end
