Feature: Responder Roteiros
    As a aluno cadastrado no sistema
    I want to responder os roteiros de exercícios
    So that eu posso receber uma avaliação dos meus conhecimentos

@gui
Scenario: Enviar uma resposta com sucesso
    Given Eu sou um "aluno" cadastrado no sistema
    And Estou na página "Roteiro 2 - Gerência de Configurações" da cadeira "ESS"
    And A questão de número "1" está visível para responder
    And O tempo da questão ainda não esgotou
    When Eu preencho a resposta da questão
    And Seleciono a opção "Enviar Resposta"
    Then Recebo uma mensagem "Resposta enviada"
    And Continuo na página "Roteiro 2 - Gerência de Configurações"
    And A questão de número "2" é exibida
    And O tempo da nova questão é iniciado automaticamente

Scenario: Enviar uma resposta vazia
    Given Eu sou um "aluno" cadastrado no sistema
    And Estou na página "Roteiro 1 - Requisitos" da cadeira "ESS"
    And A questão de número "3" está visível para responder
    And A questão não é a última
    And A resposta não tem conteúdo preenchido
    And O tempo da questão ainda não se esgotou
    When Seleciono a opção "Enviar Resposta"
    Then Sou notificado que estou pulando a questão e não poderei retornar a ela
    And Continuo na página "Roteiro 2 - Gerência de Configurações"
    And A questão de número "4" é exibida
    And O tempo da nova questão é iniciado automaticamente

Scenario: Esgotar tempo de determinada questão
    Given Eu sou um "aluno" cadastrado no sistema
    And Estou na página "Roteiro 1 - Requisitos" da cadeira "ESS"
    And A questão de número "5" está visível para responder
    And A questão não é a última
    When O tempo da questão se esgota
    Then Sou notificado que a resposta foi enviada automaticamente por execeder o tempo limite
    And Continuo na página "Roteiro 2 - Gerência de Configurações"
    And A questão de número "6" é exibida
    And O tempo da nova questão é iniciado automaticamente

Scenario: Enviar roteiro respondido
    Given Eu sou um "aluno" cadastrado no sistema
    And Estou na página "Roteiro 1 - Requisitos" da cadeira "ESS"
    And A questão de número "7" está visível para responder
    And A questão é a última 
    When A resposta é enviada
    Then Sou notificado que o Roteiro foi concluído com sucesso
    And Estou na página "ESS"



@service