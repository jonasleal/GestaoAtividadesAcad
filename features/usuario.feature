Feature: Usuario
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver, editar e convidar para participar de um projeto
  so that eu nao ter que fazer isso manualmente

  Scenario: criar usuario valido
    Given Eu abro a pagina de criar um usuario
    When Eu preencho o usuario com e-mail 'jose34@.gmail.com'
    And senha 'senhaValida12'
    And nome 'jose matias'
    And cpf '00000000000'
    And curso 'BCC'
    And especificacao 'professor'
    And  Eu clico em criar usuario
    Then Eu vejo que o usuario com e-mail 'jose34@.gmail.com' foi salvo

  Scenario: editar usuario com e-mail em branco
    Given O usuario com email 'jose34@.gmail.com', senha 'senhaValida12', nome 'jose matias', cpf '00000000000', curso 'BCC', especificacao 'professor' existe
    And Eu estou na pagina de editar do ultimo usuario criado
    When Eu modifico o e-mail do usuario para ''
    And Eu clico em editar usuario
    Then Eu vejo uma mensagem de erro

  Scenario: editar usuario com senha valida
    Given O usuario com email 'jose34@.gmail.com', senha 'senhaValida12', nome 'jose matias', cpf '00000000000', curso 'BCC', especificacao 'professor' existe
    And Eu estou na pagina de editar do ultimo usuario criado
    When Eu modifico a senha do usuario para 'meuCursoBCC'
    And Eu clico em editar usuario
    Then Eu vejo que o usuario com e-mail 'jose34@.gmail.com' foi atualizado com sucesso

  Scenario: criar usuario invalido com nome com caracteres especiais
    Given Eu abro a pagina de criar um usuario
    When Eu preencho o usuario com e-mail 'jose34@.gmail.com'
    And senha 'senhaValida12'
    And nome 'jose@@##'
    And cpf '00000000000'
    And curso 'BCC'
    And especificacao 'professor'
    And  Eu clico em criar usuario
    Then Eu vejo uma mensagem de erro