Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Pré-requisitos para cenários
        Given url baseUrl
        And path "/list/history"
        * def usuario = call read("hook.feature@CadastrarUsuario")
        * def login = call read("hook.feature@LoginUsuario")
        
        
    #Histórico de listas
        Scenario: Histórico de listas
            * def criarLista = call read("hook.feature@CriarLista")
            And header X-JWT-Token = login.response.session.token
            When method GET
            Then status 200
            And match response == "#array"
            Then match response[*].id == "#present"
            Then match response[*].userId == "#present"
            Then match response[*].description == "#present"
            Then match response[*].active == "#present"
            Then match response[*].createdAt == "#present"
            Then match response[*].updatedAt == "#present"

        Scenario: Histórico sem lista
            And header X-JWT-Token = login.response.session.token
            When method GET
            Then status 200
            And match response == "#array"
        
        Scenario: Credenciais inválidas
            And header X-JWT-Token = "token invalido"
            When method GET
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}

        Scenario: Ocorreu erro
            When method GET
            Then status 500
            And match response contains {error: "An error ocurred."}