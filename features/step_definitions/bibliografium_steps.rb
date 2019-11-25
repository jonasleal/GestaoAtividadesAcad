When("Eu estou na pagina de projeto com titulo {string}, area {string},natureza {string},data de inicio {string},data de termino {string}") do |titulo,area,natureza, dataInicio,dataFim|
  visit '/projetos/new'
  expect(page).to have_content('Novo projeto')
  fill_in 'projeto[titulo]', :with => titulo
  fill_in 'projeto[area]', :with => area
  fill_in 'projeto[tipoProjeto]', :with => natureza
  data = Date.strptime(dataInicio, '%d/%m/%Y')
  strData = data.strftime("%Y/%B/%d/")
  select_date(strData,:from => "Data de inicio")
  data = Date.strptime(dataFim, '%d/%m/%Y')
  strData = data.strftime("%Y/%B/%d/")
  select_date(strData,:from => "Data de termino")
  click_button 'Salvar'
  expect(page).to have_content('Projeto was successfully created.')
  expect(page).to have_content(titulo)
end

And("Eu clico para adicionar bibliografia") do
  find('th#addAtividade').click
end

And("Eu preencho a bibliografia com titulo {string} e descricao {string}") do |titulo, descricao|
  visit '/projetos/' + Projeto.last.id.to_s + '/bibliografia/new'
  fill_in 'bibliografium[titulo]', :with => titulo
  fill_in 'bibliografium[descricao]', :with => descricao
end

When("Eu clico criar bibliografia") do
  click_button 'Criar'
end

Then("Eu vejo que a bibliografia com titulo {string} foi criada'") do |titulo|
  expect(page).to have_content(titulo)
  expect(page).to have_content('Bibliografium was successfully created.')
end

Given("a bibliografia com titulo {string} e descricao {string} do ultimo projeto criado existe") do |titulo, descricao|
  visit '/projetos/' + Projeto.last.id.to_s
  expect(page).to have_content('Adicionando bibliografias:')
  fill_in 'bibliografium[titulo]', :with => titulo
  fill_in 'bibliografium[descricao]', :with => descricao
  click_button 'Criar bibliografia'
end

Given("Eu estou na pagina de projeto pertencido pela bibliografia") do
  visit '/projetos/' + Projeto.last.id.to_s
end

When("Eu clico em remover bibliografia") do
  find("td#delete").click
end

Then("Eu vejo que a bibliografia com titulo {string} foi removida") do |titulo|
  visit '/projetos/' + Projeto.last.id.to_s
  expect(page).to have_no_content(titulo)
end

/Criar bibliografia invalida/

Then("Eu vejo uma mensagem de erro de bibliografia") do
  expect(page).to have_content("prohibited this projeto from being saved")
end