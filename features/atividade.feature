Feature: Projeto
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver e editar atividades
  so that eu nao ter que fazer isso manualmente

  Scenario: adicionar atividade a projeto existente
    Given O projeto com titulo 'App mobile Ru' existe
    When Eu visualizo o Projeto com titulo 'App mobile Ru'
    And preencho o campo Titulo de atividade com 'Primeira atividade'
    And data de inicio da ativade com '13/11/2020'
    And data de termino da atividade com '20/11/2020'
    And preencho carga prevista da atividade com '10'
    And descrição da atividade com 'primeira entrega'
    And clico no botão Adicionar
    Then Eu vejo que a atividade com titulo 'Primeira atividade' foi criado

  Scenario: adicionar atividade sem titulo
    Given O projeto com titulo 'App mobile Ru' existe
    When Eu visualizo o Projeto com titulo 'App mobile Ru'
    And preencho o campo Titulo de atividade com ''
    And data de inicio da ativade com '13/11/2020'
    And data de termino da atividade com '20/11/2020'
    And preencho carga prevista da atividade com '10'
    And descrição da atividade com 'primeira entrega'
    And clico no botão Adicionar
    Then Eu vejo uma mensagem de erro de atividade

  Scenario: editar titulo de atividade
    Given O projeto com titulo 'App mobile Ru' existe
    And no projeto 'App mobile Ru' a atividade com titulo 'Primeira atividade' existe
    When clico em editar da atividade com titulo 'Primeira atividade'
    And preencho o campo Titulo de atividade com 'Atividade corrigida'
    And clico no botão atualizar
    Then Eu vejo que a atividade com titulo 'Atividade corrigida' foi criado

  Scenario: editar carga prevista negativa
    Given O projeto com titulo 'App mobile Ru' existe
    And no projeto 'App mobile Ru' a atividade com titulo 'Primeira atividade' existe
    When clico em editar da atividade com titulo 'Primeira atividade'
    And preencho carga prevista da atividade com '-1'
    And clico no botão atualizar
    Then Eu vejo uma mensagem de erro

  Scenario: editar carga prevista negativa
    Given O projeto com titulo 'App mobile Ru' existe
    And no projeto 'App mobile Ru' a atividade com titulo 'Primeira atividade' existe
    When clico em editar da atividade com titulo 'Primeira atividade'
    And preencho carga realizada da atividade com '-1'
    And clico no botão atualizar
    Then Eu vejo uma mensagem de erro

  Scenario: remover atividade existente
    Given O projeto com titulo 'App mobile Ru' existe
    And no projeto 'App mobile Ru' a atividade com titulo 'Primeira atividade' existe
    When clico em excluir da atividade com titulo 'Primeira atividade'
    Then Eu vejo que a atividade com titulo 'Primeira atividade' foi apagada
