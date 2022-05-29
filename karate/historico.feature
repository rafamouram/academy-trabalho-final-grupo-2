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
        Scenario: Histórico de listas
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

        Scenario: Encontrar lista inativa
            * def historico = call read("hook.feature@Historico")            
            And header X-JWT-Token = login.response.session.token
            And path historico.response[0].id
            When method GET
            Then status 200
        
        Scenario: Credenciais inválidas
            * def historico = call read("hook.feature@Historico")            
            And header X-JWT-Token = "token invalido"
            And path historico.response[0].id
            When method GET
            Then status 401
            And match response contains {status: 401, message: "Invalid token."}

        #Passando id inexistente
        Scenario: Credenciais com lista não encontrada
            * def historico = call read("hook.feature@Historico")            
            And header X-JWT-Token = login.response.session.token
            And path "3fa85f64-5717-4562-b3fc-2c963f66afa9"
            When method GET
            Then status 404
            And match response contains {error: "List not found."}
        
        #Passando id inválido
        Scenario: Forçando erro
            * def historico = call read("hook.feature@Historico")            
            And header X-JWT-Token = login.response.session.token
            And path "id-invalido"
            When method GET
            Then status 500
            And match response contains {error: "An error ocurred."}

        