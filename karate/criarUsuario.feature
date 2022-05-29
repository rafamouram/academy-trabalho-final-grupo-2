Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar o site e o link de cadastro
        Given url baseUrl
        And path "users"

        Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
            * def userNameAleatorio = "Onipresente" + java.util.UUID.randomUUID()
            * def userEmailAleatorio = java.util.UUID.randomUUID() + "@gmail.com"
            * def userPasswordAleatorio = "123456"

            * def payloadUsuario = read('user.json')
            And request payloadUsuario
            When method post
            Then status 201
            And match response contains { "name": "#(userNameAleatorio)", "email": "#(userEmailAleatorio)" }	

        Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
            * def registrar = call read("hook.feature@CadastrarUsuario")
            * def userNome = "Contas" + java.util.UUID.randomUUID()
            * def userEmail = registrar.response.email
            * def userSenha = java.util.UUID.randomUUID()
            * def payload = { name: "nome", email: "#(userEmail)", password: "#(userSenha)"}

            And request payload
            When method post
            Then status 422
            And match response contains { error: "User already exists."}

        Scenario: Cadastrar usuário sem senha
            * def userSemSenha = {name: "teste", email: "teste@grupo2.com", password: ""}
            And request userSemSenha
            When method post
            Then status 400
            And match response contains { error: "Bad request."}

        Scenario Outline: Cadastrar com e-mail inválido
            * def userComEmailInvalido = {name: "Grupo", email: <userEmail> , password: "teste"} 
            And request userComEmailInvalido
            When method post
            Then status 400
            And match response contains { error: "Bad request."}
            Examples:
                | userEmail                                                                                          |
                | OnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresente@gmail.com |
                | onipresente@22com                                                                                  |
                | onipresente22.com                                                                                  | 
                |                                                                                                    | 

        # Erro da API - status code esperado = 400, status code obtido = 200
        Scenario: Cadastrar com nome com mais de 100 letras
            * def userComNomeInvalido = {name: "OnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresente" , email: "grupo2@gmail.com" , password: "teste"} 
            And request userComNomeInvalido
            When method post
            Then status 400
            And match response contains { error: "Bad request."}

        Scenario: Cadastrar sem preencher o campo nome
            * def userComNomeInvalido = {name: "" , email: "grupo2@gmail.com" , password: "teste"} 
            And request userComNomeInvalido
            When method post
            Then status 400
            And match response contains { error: "Bad request."}

        # Erro da API - status code esperado = 400, status code obtido = 201  
        Scenario: Cadastrar com nome com números
            * def nomeInvalido = "Oni" + java.util.UUID.randomUUID()
            * def userComNomeInvalido = {name: "#(nomeInvalido)" , email: "grupo2@gmail.com" , password: "teste"} 
            And request userComNomeInvalido
            When method post
            Then status 400
            And match response contains { error: "Bad request."}                                                                                                                                             

        # Erro da API - status code esperado = 400, status code obtido = 200
        Scenario: Cadastrar usuário com caractere especial inválido no email
            * def emailInvalido =  java.util.UUID.randomUUID() + "&@gmail.com"
            * def userEmailCaractereInvalido = {name: "Onipresentes", email: "#(emailInvalido)", password: "1234567"}
            And request userEmailCaractereInvalido
            When method post
            Then status 400
            And match response contains { error: "Bad request."}