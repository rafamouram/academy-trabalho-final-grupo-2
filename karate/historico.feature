Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acesso a API
        Given url baseUrl

        Scenario: Histórico
            Given path "/list/history"
            And header X-JWT-Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpZCI6IjRjMmQwYmE5LWEyOWEtNGVkYi1iMjViLTQ5ZDEyNzU2NmY0MyIsImlzX2FkbWluIjpmYWxzZSwiZW1haWwiOiJiYkBiYi5iYiIsImRhdGVDcmVhdGVkIjoxNjUzNDkwOTEzNTAzLCJpc3N1ZWQiOjE2NTM0OTA5MTM1MDMsImV4cGlyZXMiOjE2NTM0OTE4MTM1MDN9.lEsfbDHOCvOMN554TOdsV3NrdwBi7_73XED8SMmrNyNKWmxL1KL0dhZfPamtuQjZ_eHX-CHHjPeKR91Y9Vctjg"
            When method GET
            Then status 200
    # Background: Acessar e logar no site
    #     * def registrar = call read("hook.feature@cadastrarUsuario")
    #     * def userEmail = registrar.response.email
    #     * def userSenha = registrar.userSenhaAleatorio
    #     Given url baseUrl
    #     And path "auth/login"
    #     And multipart field email = { filename: "#(userEmail)", contentType: 'multipart/form-data' }
    #     And multipart field password = { filename: "#(userSenha)", contentType: 'multipart/form-data' }
    #     When method post
    #     Then status 200
    #     * def token = response.session.token

    #         Scenario: teste
    #         * def criarLista = call read("hook.feature@criarLista")

            


        # Scenario: É possível visualizar apenas as 10 listas mais recentes no histórico
        # And path "list/history"
       
        # When method get
        # Then status 200
