Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar o site e entrar na tela de registro
        Given url baseUrl
        And path "users"

        # Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
        #     * def userNameAleatorio = "Onipresente" + java.util.UUID.randomUUID()
        #     * def userEmailAleatorio = java.util.UUID.randomUUID() + "@gmail.com"
        #     * def userSenhaAleatoria = "123456"

        #     * def payloadUsuario = read('user.json')
        #     And request payloadUsuario
        #     When method post
        #     Then status 201  

        # Scenario: Não deve ser possível cadastrar usuário com e-mail sem @
        #     * def userComEmailMaisDe60Caracteres = {name: "Grupo", email: "onipresente22.com", password: "teste"} 
        #     And request userComEmailMaisDe60Caracteres
        #     When method post
        #     Then status 400

        # Scenario: Não deve ser possível cadastrar usuário com e-mail sem .
        #     * def userComEmailMaisDe60Caracteres = {name: "Grupo", email: "onipresente@22com", password: "teste"} 
        #     And request userComEmailMaisDe60Caracteres
        #     When method post
        #     Then status 400

        # Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
        #     * def registrar = call read("hook.feature@CadastrarUsuario")
        #     * def userNome = "Contas" + java.util.UUID.randomUUID()
        #     * def userEmail = registrar.response.email
        #     * def userSenha = java.util.UUID.randomUUID()
        #     * def payload = { name: "nome", email: "#(userEmail)", password: "#(userSenha)"}

        #     And request payload
        #     When method post
        #     Then status 422
        #     And match response contains { error: "User already exists."}

        # Scenario: Cadastrar usuário com e-mail com caractere inválido
        #     * def userComEmailInvalido = {name: "Grupo", email: "onite&@22.com", password: "teste"} 
        #     And request userComEmailInvalido
        #     When method post
        #     Then status 400

        # Scenario: Cadastrar com e-mail com mais de 60 caracteres
        #     * def userComEmailMaisDe60Caracteres = {name: "Grupo", email: "onipresenteonipresenteonipresenteonipresenteonipresenteonipresente@22.com", password: "teste"} 
        #     And request userComEmailMaisDe60Caracteres
        #     When method post
        #     Then status 400

        
        # Scenario: Cadastrar com nome com mais de 100 letras
        #     * def userComNomeMaisDe100Letras = {name: "OnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresenteOnipresente", email: "teste@22.com", password: "teste"}                                                                                                          
        #     And request userComNomeMaisDe100Letras
        #     When method post
        #     Then status 400

        # Scenario: Cadastrar usuário sem nome
        #     * def userSemNome = {name: "", email: "teste@22.com", password: "1234567"}
        #     And request userSemNome
        #     When method post
        #     Then status 400

        # Scenario: Cadastrar usuário sem e-mail
        #     * def userSemEmail = {name: "teste", email: "", password: "1234567"}
        #     And request userSemEmail
        #     When method post
        #     Then status 400

        # Scenario: Cadastrar usuário sem senha
        #     * def userSemSenha = {name: "teste", email: "teste@grupo2.com", password: ""}
        #     And request userSemSenha
        #     When method post
        #     Then status 400


        Scenario Outline: Cadastrar com e-mail inválido
            * def userComEmailInvalido = {name: "Grupo", email: <userEmail> , password: "teste"} 
            And request userComEmailInvalido
            When method post
            Then status 400
            Examples:
                | userEmail                                                                       |
                | onipresenteonipresenteonipresenteonipresenteonipresenteonipresente@22.com       |
                | onite&@22.com                                                                   |
                | onipresente@22com                                                               |
                | onipresente22.com                                                               | 
                |                                                                                 | 