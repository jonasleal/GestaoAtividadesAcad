Given(/^Eu abro a pagina de criar Projeto$/) do
  visit 'projetos/new'
  expect(page).to have_content('Novo projeto')
end

When('Eu preencho o Projeto com titulo {string}') do |titulo|
  fill_in 'projeto[titulo]', with: titulo
end

And('area {string}') do |area|
  fill_in 'projeto[area]', with: area
end

And('natureza {string}') do |tipo|
  fill_in 'projeto[tipoProjeto]', with: tipo
end

And('data de inicio {string}') do |dataInicio|
  data = Date.strptime(dataInicio, '%d/%m/%Y')
  strData = data.strftime('%Y/%B/%d/')
  select_date(strData,:from => 'Data de inicio')
end

And('data de termino {string}') do |dataFim|
  data = Date.strptime(dataFim, '%d/%m/%Y')
  strData = data.strftime("%Y/%B/%d/")
  select_date(strData,:from => "Data de termino")
end

And('Eu clico criar projeto') do
  click_button 'Criar projeto'
end

Then('Eu vejo que o projeto com titulo {string} foi criado') do |titulo|
  expect(page).to have_content(titulo)
end

Then('Eu vejo uma mensagem erro ao criar projeto') do
  expect(page).to have_selector('div', :id => 'projeto_erro')
end

Given("O projeto com titulo {string}, area {string},natureza {string},data de inicio {string},data de termino {string} existe") do |titulo,area,natureza, dataInicio,dataFim|
  visit 'projetos/new'
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
  click_button 'Criar projeto'
  expect(page).to have_content('Projeto was successfully created.')
  expect(page).to have_content(titulo)
end

Given('Eu estou na pagina de projetos') do
  visit '/projetos'
  expect(page).to have_current_path('/projetos')
end

When('Eu clico em remover projeto com titulo {string}') do |titulo|
  click_link "d-#{titulo}"
end

Then('Eu vejo que o  projeto com titulo {string} foi removido') do |titulo|
  visit '/projetos'
  expect(page).to have_no_content(titulo)
end