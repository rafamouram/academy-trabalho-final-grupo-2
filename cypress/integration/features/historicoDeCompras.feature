Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acessar e logar no site
        # Given que acessei o site Lembra Compras
        # And loguei no site
        # | email | bruno@gmail.com |
        # | senha | bruno           |
        And acessei o histórico

    @logarSite
        Scenario: É possível visualizar apenas as 10 listas mais recentes no histórico
            Then visualizo o histórico com apenas as 10 listas mais recentes
            And visualizo o nome e data de criação da lista
            | descricao   |  Lista de natal  |
        
        Scenario Outline: É possível visualizar o nome e os itens de uma lista no histórico    
            When clico na lista de compras do histórico
            Then visualizo o nome da lista e os itens dentro desta
            | item        |    <item>     |
            | quantidade  |  <quantidade> |
            
            Examples:
            | item        |  quantidade   | 
            | Playstation |      1        |
            | Bola        |      2        |
            | Celular     |      1        |
