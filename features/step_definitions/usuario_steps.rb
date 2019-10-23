/Criar usuario valido/

Given('Eu abro a pagina de criar um usuario') do
  visit '/usuarios/new'
  expect(page).to have_content('Novo Usuario')
end

When('Eu preencho o usuario com e-mail {string}') do |email|
  fill_in 'usuario[email]', :with => email
end

And('senha {string}') do |senha|
  fill_in 'usuario[senha]', :with => senha
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

And('especificacao {string}') do |especificacao|
  fill_in 'usuario[especificao]', :with => especificacao
end

And('Eu clico em criar usuario') do
  click_button 'Create Usuario'
end

Then('Eu vejo que o usuario com e-mail {string} foi salvo') do |email|
  expect(page).to have_content('Usuario was successfully created.')
  expect(page).to have_content(email)
end

/Editar usuario com e-mail em branco/

Given('O usuario com email {string}, senha {string}, nome {string}, cpf {string}, curso {string}, especificacao {string} existe') do |email, senha, nome, cpf, curso, especificacao|
  visit '/usuarios/new'
  expect(page).to have_content('Novo Usuario')
  fill_in 'usuario[email]', :with => email
  fill_in 'usuario[senha]', :with => senha
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[cpf]', :with => cpf
  fill_in 'usuario[curso]', :with => curso
  fill_in 'usuario[especificao]', :with => especificacao
  click_button 'Create Usuario'
  expect(page).to have_content('Usuario was successfully created.')
  expect(page).to have_content(email)
end

And('Eu estou na pagina de editar usuario com email {string}') do |email|
  visit '/usuarios/' + Usuario.last.id.to_s + '/edit'
  expect(page).to have_content('Editar Usuario')
end

When('Eu modifico o e-mail do usuario para {string}') do |email|
  fill_in 'usuario[email]', :with => email
end

And('Eu clico em editar usuario') do
  click_button 'Update Usuario'
end

Then('Eu vejo uma mensagem de erro') do
  assert_selector('div#error_explanation', text: "")
end

/Editar usuario com senha valida/

When('Eu modifico a senha do usuario para {string}') do |senha|
  fill_in 'usuario[senha]', :with => senha
end

Then('Eu vejo que o usuario com e-mail {string} foi atualizado com sucesso') do |email|
  expect(page).to have_content('Usuario was successfully updated.')
  expect(page).to have_content(email)
end