Feature: Usuario
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver e editar
  so that eu nao ter que fazer isso manualmente

  Scenario: criar usuario valido
    Given Eu abro a pagina de criar um usuario
    When Eu preencho o usuario com e-mail 'irisviana12@gmail.com'
    And senha 'senhaValida12'
    And confirmacao de senha 'senhaValida12'
    And nome 'iris silva'
    And cpf '809.098.098-00'
    And curso 'BCC'
    And  Eu clico em criar usuario
    Then Eu vejo que o usuario com nome 'iris silva' foi salvo

  Scenario: editar usuario com e-mail em branco
    Given O usuario com email 'irisviana12@gmail.com', senha 'senhaValida12', nome 'iris silva', cpf '809.098.098-00', curso 'BCC'
    And Eu estou na pagina de editar do ultimo usuario criado
    When Eu modifico o e-mail do usuario para ''
    And Eu preencho senha com 'senhaValida12'
    And Eu clico em editar usuario
    Then Eu vejo uma mensagem de erro

  Scenario: editar usuario com senha valida
    Given O usuario com email 'irisviana12@gmail.com', senha 'senhaValida12', nome 'iris silva', cpf '809.098.098-00', curso 'BCC'
    And Eu estou na pagina de editar do ultimo usuario criado
    When Eu modifico a senha do usuario para de 'senhaValida12' para 'meuCursoBCC'
    And Eu clico em editar usuario
    Then Eu vejo que o usuario foi atualizado com sucesso

  Scenario: criar usuario invalido com nome com caracteres especiais
    Given Eu abro a pagina de criar um usuario
    When Eu preencho o usuario com e-mail 'irisviana12@gmail.com'
    And senha 'senhaValida12'
    And confirmacao de senha 'senhaValida12'
    And nome 'iris@@##'
    And cpf '809.098.098-00'
    And curso 'BCC'
    And  Eu clico em criar usuario
    Then Eu vejo uma mensagem de erro

  Scenario: remover um usuario existente
    Given O usuario com email 'irisviana12@gmail.com', senha 'senhaValida12', nome 'iris silva', cpf '809.098.098-00', curso 'BCC'
    And Eu estou na pagina de usuarios
    When Eu clico em cancelar conta do usuario com email 'irisviana12@gmail.com'
    Then Eu vejo que o usuairo com email 'irisviana12@gmail.com' foi removido