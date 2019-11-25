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

  Scenario: editar titulo de atividade
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And O projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019' existe
    And A atividade com titulo 'Primeira atividade' existe
    When Clico em editar da atividade com titulo 'Primeira atividade'
    And Preencho o campo Titulo de atividade com 'Atividade corrigida'
    And Eu clico em atualizar
    Then Eu vejo que a atividade com titulo 'Atividade corrigida' foi atualizada

  Scenario: editar carga prevista negativa
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And O projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019' existe
    And A atividade com titulo 'Primeira atividade' existe
    When Clico em editar da atividade com titulo 'Primeira atividade'
    And Preencho o campo carga prevista de atividade com '-1'
    And Eu clico em atualizar
    Then Eu vejo uma mensagem de erro

  Scenario: editar carga prevista negativa
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And O projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019' existe
    And A atividade com titulo 'Primeira atividade' existe
    When Clico em editar da atividade com titulo 'Primeira atividade'
    And Preencho o campo carga realizada de atividade com '-1'
    And Eu clico em atualizar
    Then Eu vejo uma mensagem de erro

  Scenario: remover atividade existente
    Given O usuario com email 'irisviana@gmail.com', senha '123456', nome 'iris viana', cpf '678.809.709-01', curso 'BCC' esta logado no sistema
    And Eu abro a pagina de criar Projeto
    When Eu estou na pagina de projeto com titulo 'App atividade', area 'informatica',natureza 'tcc',data de inicio '20/11/2019',data de termino '30/11/2019'
    And Eu clico para adicionar atividade
    And Eu preencho a atividade com titulo 'Primeira atividade', data de inicio com '13/11/2020', data de termino da atividade com '01/11/2020', carga prevista com '10' e com descricao 'primeira entrega'
    And Clico no botao Adicionar
    When Clico em excluir da atividade
    Then Eu vejo que a atividade com titulo 'Primeira atividade' foi apagada