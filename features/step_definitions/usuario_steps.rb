/Criar usuario valido/

Given('Eu abro a pagina de criar um usuario') do
  visit '/usuarios/sign_up'
  expect(page).to have_content('Cadastre-se')
end

When('Eu preencho o usuario com e-mail {string}') do |email|
  fill_in 'usuario[email]', :with => email
end

And('senha {string}') do |senha|
  fill_in 'usuario[password]', :with => senha
end

And('confirmacao de senha {string}') do |senha|
  fill_in 'usuario[password_confirmation]', :with => senha
end

And('nome {string}') do |nome|
  fill_in 'usuario[nome]', :with => nome
end

And('cpf {string}') do |cpf|
  fill_in 'usuario[cpf]', :with => cpf
end

And('curso {string}') do |curso|
  fill_in 'usuario[curso]', :with => curso
end

And('Eu clico em criar usuario') do
  click_button 'Salvar'
end

Then('Eu vejo que o usuario com nome {string} foi salvo') do |nome|
  expect(page).to have_content("Bem vindo #{nome}")
end

/Editar usuario com e-mail em branco/

Given('O usuario com email {string}, senha {string}, nome {string}, cpf {string}, curso {string}') do |email, senha, nome, cpf, curso|
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

And('Eu estou na pagina de editar do ultimo usuario criado') do
  visit '/usuarios/' + '/edit' + '.' + Usuario.last.id.to_s
  expect(page).to have_content('Editar Usuario')
end

When('Eu modifico o e-mail do usuario para {string}') do |email|
  fill_in 'usuario[email]', :with => email
end

And('Eu preencho senha com {string}') do |senha|
  fill_in 'usuario[current_password]', :with => senha
end

And('Eu clico em editar usuario') do
  click_button 'Update'
end

Then('Eu vejo uma mensagem de erro') do
  expect(page).to have_content('prohibited this usuario from being saved')
end

/Editar usuario com senha valida/

When('Eu modifico a senha do usuario para de {string} para {string}') do |senhaAntiga, senhaAtual|
  fill_in 'usuario[password]', :with => senhaAtual
  fill_in 'usuario[password_confirmation]', :with => senhaAtual
  fill_in 'usuario[current_password]', :with => senhaAntiga
end

Then('Eu vejo que o usuario foi atualizado com sucesso') do
  expect(page).to have_content('Your account has been updated successfully.')
end

Given("Eu estou na pagina de usuarios") do
  visit '/usuarios'
  expect(page).to have_current_path('/usuarios')
end

When("Eu clico em cancelar conta do usuario com email {string}") do |email|
  click_link "d-#{email}"
end

Then("Eu vejo que o usuairo com email {string} foi removido") do |email|
  visit '/usuarios'
  expect(page).to have_no_content(email)
end