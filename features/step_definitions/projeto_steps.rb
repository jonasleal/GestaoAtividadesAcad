Given('O usuario com email {string}, senha {string}, nome {string}, cpf {string}, curso {string} esta logado no sistema') do |email, senha, nome, cpf, curso|
  visit '/usuarios/sign_up'
  expect(page).to have_content('Cadastre-se')
  fill_in 'usuario[email]', :with => email
  fill_in 'usuario[password]', :with => senha
  fill_in 'usuario[password_confirmation]', :with => senha
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[cpf]', :with => cpf
  fill_in 'usuario[curso]', :with => curso
  click_button 'Salvar'
  expect(page).to have_content("Bem vindo #{nome}")
end

And('Eu abro a pagina de criar Projeto') do
  visit '/projetos/new'
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
  click_button 'Salvar'
end

Then('Eu vejo que o projeto com titulo {string} foi criado') do |titulo|
  expect(page).to have_content(titulo)
  expect(page).to have_content('Projeto was successfully created.')
end

Then('Eu vejo uma mensagem erro ao criar projeto') do
  expect(page).to have_content('prohibited this projeto from being saved')
end

And("O projeto com titulo {string}, area {string},natureza {string},data de inicio {string},data de termino {string} existe") do |titulo,area,natureza, dataInicio,dataFim|
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

Given('Eu estou na pagina de projetos') do
  visit '/projetos'
  expect(page).to have_current_path('/projetos')
end

When('Eu clico em remover projeto com titulo {string}') do |titulo|
  click_link "d-#{titulo}"
end

Then('Eu vejo que o projeto foi removido') do
  expect(page).to have_content('Projeto was successfully destroyed.')
end