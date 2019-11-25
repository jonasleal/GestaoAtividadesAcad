def criarAtividade(tituloAtiv, dataInicio, dataFim, cargaPrev, descricao)
  click_link 'Adicionar'
  expect(page).to have_content('New Atividade')
  fill_in 'atividade[titulo]', with: tituloAtiv
  select_date(dataInicio,:from => 'Data de inicio')
  select_date(dataFim,:from => "Data de termino")
  fill_in 'atividade[cargaPrev]', with: cargaPrev
  fill_in 'atividade[descricao]', with: descricao
  click_button 'Adicionar'
  expect(page).to have_content(tituloAtiv)
  expect(page).to have_content('Atividade was successfully created.')
end

And("Eu clico para adicionar atividade") do
  find('th#addBibliografia').click
end

And('Eu preencho a atividade com titulo {string}, data de inicio com {string}, data de termino da atividade com {string}, carga prevista com {string} e com descricao {string}') do |titulo, dataInicio, dataFim, cargaPrev, descricao|
  visit '/projetos/' + Projeto.last.id.to_s + '/atividades/new'
  fill_in 'atividade[titulo]', with: titulo
  data = Date.strptime(dataInicio, '%d/%m/%Y')
  strData = data.strftime('%Y/%B/%d/')
  select_date(strData, :from => 'Início')
  data = Date.strptime(dataFim, '%d/%m/%Y')
  strData = data.strftime('%Y/%B/%d/')
  select_date(strData, :from => 'Fim')
  fill_in 'atividade[cargaPrev]', with: cargaPrev
  fill_in 'atividade[descricao]', with: descricao
end

And('Clico no botao Adicionar') do
  click_button 'Adicionar'
end

Then('Eu vejo que a atividade com titulo {string} foi atualizada') do |titulo|
  expect(page).to have_content(titulo)
  expect(page).to have_content('Atividade was successfully updated.')
end

And('A atividade com titulo {string} existe') do |tituloAtiv|
  criarAtividade(tituloAtiv,(Date.current + 1.day).strftime('%Y/%B/%d/'),
                 (Date.current + 10.day).strftime('%Y/%B/%d/'), "10", "Entrega da primeira atividade")
end

When('Clico em editar da atividade com titulo {string}') do |titulo|
  click_link "e-#{titulo}"
end

And('Eu clico em atualizar') do
  click_button 'Update Atividade'
end

When('Clico em excluir da atividade') do
  find("td#deleteAtivi").click
end

Then('Eu vejo que a atividade com titulo {string} foi apagada') do |titulo|
  expect(page).to have_no_content(titulo)
  expect(page).to have_content('Atividade was successfully destroyed.')
end

Then('Eu vejo que a atividade com titulo {string} foi criada') do |titulo|
  expect(page).to have_content(titulo)
  expect(page).to have_content('Atividade was successfully created.')
end

Then('Eu vejo uma mensagem de erro de atividade') do
  expect(page).to have_content('prohibited this projeto from being saved')
end

And('Preencho o campo Titulo de atividade com {string}') do |titulo|
  fill_in 'atividade[titulo]', with: titulo
end

And('Preencho o campo carga prevista de atividade com {string}') do |cargaprev|
  fill_in 'atividade[cargaPrev]', with: cargaprev
end

And('Preencho o campo carga realizada de atividade com {string}') do |cargarealizada|
  fill_in 'atividade[cargaReal]', with: cargarealizada
end

Then('Eu vejo que a atividade com titulo {string} foi apagada') do |titulo|
  expect(page).to have_no_content(titulo)
end

And('preencho carga realizada da atividade com {string}') do |cargaReal|
  fill_in 'atividade[cargaReal]', with: cargaReal
end