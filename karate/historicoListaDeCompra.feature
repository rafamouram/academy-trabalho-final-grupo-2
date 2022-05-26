Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acesso a API
        Given url baseUrl
        And path "/list/history"
        * def usuario = call read("hook.feature@CadastrarUsuario")
        * def login = call read("hook.feature@LoginUsuario")
        
        Scenario: Histórico         
            And header X-JWT-Token = login.response.session.token
            When method GET
            Then status 200
            And match response == "#array"

        Scenario: Lista histórico
            * def lista = call read("hook.feature@CriarLista")
            * def historico = call read("hook.feature@Historico")  
            * def idLista = historico.response.id            
            #And form field X-JWT-Token = login.response.session.token
            And path idLista           
            When method GET
            Then status 200