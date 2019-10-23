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