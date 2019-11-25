Feature: Bibliografia
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover e ver bibliografias
  so that eu nao ter que fazer isso manualmente

  Scenario: criar nova bibliografia valida
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar bibliografia
    And Eu preencho a bibliografia com titulo 'Sistemas' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    Then Eu vejo que a bibliografia com titulo 'Sistemas' foi criada'

  Scenario: criar nova bibliografia com titulo em branco
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar bibliografia
    And Eu preencho a bibliografia com titulo '' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    Then Eu vejo uma mensagem de erro de bibliografia

  Scenario: criar nova bibliografia com titutlo sem o minimo de caracteres
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar bibliografia
    And Eu preencho a bibliografia com titulo 'ti' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    Then Eu vejo uma mensagem de erro de bibliografia

  Scenario: criar nova bibliografia com descricao com numeros
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar bibliografia
    And Eu preencho a bibliografia com titulo '' e descricao '12'
    And Eu clico criar bibliografia
    Then Eu vejo uma mensagem de erro de bibliografia

  Scenario: remover uma bibliografia existente
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar bibliografia
    And Eu preencho a bibliografia com titulo 'Sistemas' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    And Eu estou na pagina de projeto pertencido pela bibliografia
    When Eu clico em remover bibliografia
    Then Eu vejo que a bibliografia com titulo 'Sistemas' foi removida