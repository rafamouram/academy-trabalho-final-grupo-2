Feature: Login com um usuário
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras.

    Background: Acesso a API
        Given url baseUrl
        And path "/auth/login"
        * def usuario = call read("hook.feature@CadastrarUsuario")
        
    #Usuário autenticado
        Scenario: Logando com um usuário
            And form field email = usuario.payloadUsuario.email
            And form field password = usuario.payloadUsuario.password
            When method POST
            Then status 200
            And match response == "#object"
            And match response contains { auth: #boolean }
            And match response contains { session: #object }
            And match response.session contains { token: #string, issued: #present, expires: #present }

    #Bad request
        Scenario: Tentativa de login sem passar parametros
            When method POST
            Then status 400
            And match response == "#object"
            And match response contains { error: #string }
            And match response contains { error: "Bad request." }

        Scenario: Tentativa de login sem passar parametro Email
            And form field password = usuario.payloadUsuario.password
            When method POST
            Then status 400
            And match response == "#object"
            And match response contains { error: #string }
            And match response contains { error: "Bad request." }
        
        Scenario: Tentativa de login sem passar parametro Password
            And form field email = usuario.payloadUsuario.email
            When method POST
            Then status 400
            And match response == "#object"
            And match response contains { error: #string }
            And match response contains { error: "Bad request." }
    
    #Autenticação falhou
        Scenario: Tentativa de login com Email e Password em branco
            And form field email = " "
            And form field password = " "
            When method POST
            Then status 403
            And match response == "#object"
            And match response contains { error: #string }
            And match response contains { error: "Invalid email or password." }

        Scenario: Tentativa de login com Email incorreto
            And form field email = "incorreto"
            And form field password = usuario.payloadUsuario.password
            When method POST
            Then status 403
            And match response == "#object"
            And match response contains { error: #string }
            And match response contains { error: "Invalid email or password." }

        Scenario: Tentativa de login com Password incorreto
            And form field email = usuario.payloadUsuario.email
            And form field password = "incorreto"
            When method POST
            Then status 403
            And match response == "#object"
            And match response contains { error: #string }
            And match response contains { error: "Invalid email or password." }