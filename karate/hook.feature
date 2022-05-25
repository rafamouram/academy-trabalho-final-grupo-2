Feature: Hook Criar

    @cadastrarUsuario
    Scenario: Cadastrar usuário
        * def userNameAleatorio = "Onipresente" + java.util.UUID.randomUUID()
        * def userEmailAleatorio = java.util.UUID.randomUUID() + "@gmail.com"
        * def userSenhaAleatorio = java.util.UUID.randomUUID() + "a"

        * def payloadUsuario = read('user.json')
        Given url baseUrl
        And path "users"
        And request payloadUsuario
        When method post
        Then status 201

    @criarLista
    Scenario: Criar lista
        * def descricaoDaListaAleatoria = "Lista" + java.util.UUID.randomUUID()
        * def token = "#(sessionToken)"
        * def payloadLista = read('lista.json')
 
        Given url baseUrl + "/list"
        And request payloadLista
        When method post
        Then status 201

    @salvarLista
    Scenario: Salvar lista



