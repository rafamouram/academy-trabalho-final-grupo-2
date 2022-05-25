Feature: Hook Criar

    Scenario: Cadastrar usuário
        * def userNameAleatorio = "Onipresente" + java.util.UUID.randomUUID()
        * def userEmailAleatorio = java.util.UUID.randomUUID() + "@gmail.com"
        * def userSenhaAleatorio = java.util.UUID.randomUUID()

        * def payloadUsuário = read('user.json')
        Given url baseUrl
        And request payloadUsuário
        When method post
        Then status 201  

    Scenario: Criar lista
        * def descricaoDaListaAleatoria = "Lista" + java.util.UUID.randomUUID()
        * def payloadLista = read('lista.json')
 
        Given url baseUrl + "/list"
        And request payloadLista
        When method post
        Then status 201


