Feature: Projeto
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver e editar projetos
  so that eu nao ter que fazer isso manualmente

  Scenario: criar novo Projeto valido
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo 'App mobile Ru'
    And area 'informatica'
    And natureza 'pesquisa de extensao'
    And data de inicio '20/10/2019'
    And data de termino '31/10/2019'
    And Eu clico criar projeto
    Then Eu vejo que o projeto com titulo 'App mobile Ru' foi criado


  Scenario: criar novo Projeto com titulo em branco
    Given Eu abro a pagina de criar Projeto
    When Eu preencho o Projeto com titulo ''
    And area 'informatica'
    And natureza 'pesquisa de extensao'
    And data de inicio '20/10/2019'
    And data de termino '31/10/2019'
    And Eu clico criar projeto
    Then Eu vejo uma mensagem de titulo invalido