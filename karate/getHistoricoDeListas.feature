Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Pré-requisitos para cenários
        Given url baseUrl
        And path "/list/history"
        * def usuario = call read("hook.feature@CadastrarUsuario")
        * def login = call read("hook.feature@LoginUsuario")
        * def criarLista = call read("hook.feature@CriarLista")
        
    #Histórico de listas
        Scenario: Retorno de listas do usuário
            And header X-JWT-Token = login.response.session.token
            When method GET
            Then status 200
            And match response == "#array"