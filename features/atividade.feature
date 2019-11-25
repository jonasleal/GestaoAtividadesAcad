Feature: Projeto
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver e editar atividades
  so that eu nao ter que fazer isso manualmente

  Scenario: adicionar atividade a projeto existente
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar atividade
    And Eu preencho a atividade com titulo 'Primeira atividade', data de inicio com '13/11/2020', data de termino da atividade com '20/11/2020', carga prevista com '10' e com descricao 'primeira entrega'
    And Clico no botao Adicionar
    Then Eu vejo que a atividade com titulo 'Primeira atividade' foi criada

  Scenario: adicionar atividade com data invalida
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar atividade
    And Eu preencho a atividade com titulo 'Primeira atividade', data de inicio com '13/11/2020', data de termino da atividade com '01/11/2020', carga prevista com '10' e com descricao 'primeira entrega'
    And Clico no botao Adicionar
    Then Eu vejo uma mensagem de erro de atividade

  Scenario: adicionar atividade sem titulo
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar atividade
    And Eu preencho a atividade com titulo '', data de inicio com '13/11/2020', data de termino da atividade com '20/11/2020', carga prevista com '10' e com descricao 'primeira entrega'
    And Clico no botao Adicionar
    Then Eu vejo uma mensagem de erro de atividade