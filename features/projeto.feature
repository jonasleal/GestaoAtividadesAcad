Feature: Projeto
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver e editar projetos
  so that eu nao ter que fazer isso manualmente

  Scenario: criar novo Projeto valido
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo 'App mobile Ru'
    And area 'informatica'
    And natureza 'pesquisa de extensao'
    And data de inicio '20/11/2019'
    And data de termino '30/11/2019'
    And Eu clico criar projeto
    Then Eu vejo que o projeto com titulo 'App mobile Ru' foi criado

  Scenario: criar novo Projeto com titulo em branco
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo ''
    And area 'informatica'
    And natureza 'pesquisa de extensao'
    And data de inicio '20/11/2019'
    And data de termino '30/11/2019'
    And Eu clico criar projeto
    Then Eu vejo uma mensagem erro ao criar projeto


  Scenario: criar novo Projeto com area em branco
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo 'App mobile Ru'
    And area ''
    And natureza 'pesquisa de extensao'
    And data de inicio '20/11/2019'
    And data de termino '30/11/2019'
    And Eu clico criar projeto
    Then Eu vejo uma mensagem erro ao criar projeto

  Scenario: criar novo Projeto com natureza em branco
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo 'App mobile Ru'
    And area 'informatica'
    And natureza ''
    And data de inicio '20/11/2019'
    And data de termino '30/11/2019'
    And Eu clico criar projeto
    Then Eu vejo uma mensagem erro ao criar projeto

  Scenario: criar novo Projeto com data de termino no passado
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo 'App mobile Ru'
    And area 'informatica'
    And natureza 'pesquisa de extensao'
    And data de inicio '10/11/2019'
    And data de termino '06/11/2019'
    And Eu clico criar projeto
    Then Eu vejo uma mensagem erro ao criar projeto

  Scenario: remover um projeto existente
    Given O projeto com titulo 'App mobile Ru', area 'informatica',natureza 'pesquisa de extensao',data de inicio '20/11/2019',data de termino '30/11/2019' existe
    And Eu estou na pagina de projetos
    When Eu clico em remover projeto com titulo 'App mobile Ru'
    Then Eu vejo que o  projeto com titulo 'App mobile Ru' foi removido