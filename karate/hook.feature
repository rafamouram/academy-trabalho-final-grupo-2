Feature: Hook Criar

Background: Critérios para o Hook
    Given url baseUrl

        @CadastrarUsuario
        Scenario: Cadastrar Usuário
            * def userNameAleatorio = "Equipe Onipresente"
            * def userEmailAleatorio = Date.now().toString()+"@gmail.com"
            * def userPasswordAleatorio = Date.now().toString()
            * def payloadUsuario = read('user.json')          
            And path "/users"
            And request payloadUsuario
            When method POST
            Then status 201
        
        @LoginUsuario
        Scenario: Login Usuário      
            And path "/auth/login"
            And form field email = usuario.payloadUsuario.email
            And form field password = usuario.payloadUsuario.password
            When method POST
            Then status 200

        @CriarLista
        Scenario: Criar Lista
            * def descricaoDaListaAleatoria = "Lista " + Date.now().toString()
            * def payloadLista = read('lista.json')
            And path "/list"
            And header X-JWT-Token = login.response.session.token
            And request payloadLista
            When method POST
            Then status 201
        
        @Historico
        Scenario: Historico
            And path "/list/history"
            And header X-JWT-Token = login.response.session.token
            When method GET
            Then status 200         

#    AO COPIAR ESTE ARQUIVO NÃO ESQUEÇA DE COPIAR TAMBEM O 
#    LISTA.JSON E USER.JSON