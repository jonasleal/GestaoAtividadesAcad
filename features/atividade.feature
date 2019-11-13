Feature: Projeto
  As a usuario do sistema Gerenciamento de atividades academicas
  I want to criar, remover, ver e editar atividades
  so that eu nao ter que fazer isso manualmente

  Scenario: adicionar atividade a projeto existente
    Given O projeto com titulo 'App mobile Ru' existe
    When Eu visualizo o Projeto com titulo 'App mobile Ru'
    And apreencho o campo Titulo de atividade com 'Primeira atividade'
    And data de inicio da ativade com '13/11/2020'
    And data de termino da atividade com '20/11/2020'
    And carga prevista da atividade com '10'
    And descrição da atividade com 'primeira entrega'
    And clico no botão Adicionar
    Then Eu vejo que a atividade com titulo 'Primeira atividade' foi criado
