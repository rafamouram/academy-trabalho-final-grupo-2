Feature: Hook Criar

Background: Critérios para o Hook
    * def userNameAleatorio = "Equipe Onipresente"
    * def userEmailAleatorio = Date.now().toString()+"@gmail.com"
    * def userPasswordAleatorio = Date.now().toString()
    * def payloadUsuario = read('user.json')
    Given url baseUrl

        @CadastrarUsuario
        Scenario: Cadastrar Usuário            
            And path "/users"
            And request payloadUsuario
            When method post
            Then status 201
        
        @LoginUsuario
        Scenario: Login Usuário
            #* def usuario = call read("hook.feature@CadastrarUsuario")        
            And path "/auth/login"
            And form field email = usuario.payloadUsuario.email
            And form field password = usuario.payloadUsuario.password
            When method POST
            Then status 200

        @CriarLista
        Scenario: Criar Lista
            * def login = call read("hook.feature@LoginUsuario")
            * def descricaoDaListaAleatoria = "Lista " + Date.now().toString()
            * def payloadLista = read('lista.json')
            And path "/list"
            And header X-JWT-Token = login.response.session.token
            And request payloadLista
            When method post
            Then status 201


