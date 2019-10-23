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