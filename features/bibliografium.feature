Feature: Bibliografia
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover e ver bibliografias
  so that eu nao ter que fazer isso manualmente

  Scenario: criar nova bibliografia valida
    Given Eu crio o projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu estou na pagina de vizualizar ultimo projeto criado
    When Eu preencho a bibliografia com titulo 'Sistemas' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    Then Eu vejo que a bibliografia com titulo 'Sistemas' foi criada'

  Scenario: criar nova bibliografia com titulo em branco
    Given Eu crio o projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu estou na pagina de vizualizar ultimo projeto criado
    When Eu preencho a bibliografia com titulo '' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    Then Eu vejo uma mensagem de erro de bibliografia

  Scenario: criar nova bibliografia com titutlo sem o minimo de caracteres
    Given Eu crio o projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu estou na pagina de vizualizar ultimo projeto criado
    When Eu preencho a bibliografia com titulo 'ti' e descricao 'bibliografia para sistemas'
    And Eu clico criar bibliografia
    Then Eu vejo uma mensagem de erro de bibliografia

  Scenario: remover uma bibliografia existente
    Given Eu crio o projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And a bibliografia com titulo 'Sistemas' e descricao 'bibliografia para sistemas' do ultimo projeto criado existe
    And Eu estou na pagina de projeto pertencido pela bibliografia
    When Eu clico em remover bibliografia com titulo 'Sistemas'
    Then Eu vejo que a bibliografia com titulo 'Sistemas' foi removida