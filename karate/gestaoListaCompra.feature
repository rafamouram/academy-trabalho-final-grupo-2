Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar

    Background: Acesso a API
        Given url baseUrl
        And path "/list"
        * def usuario = call read("hook.feature@CadastrarUsuario")
        * def login = call read("hook.feature@LoginUsuario")

        Scenario: Lista         
            And header X-JWT-Token = login.response.session.token
            When method GET
            Then status 200
            And match response == "#array" 

        #Validando critérios de aceite 1, 3, 4
        Scenario: Criando nova lista de compras com descrição
            * def descricaoDaListaAleatoria = "Lista " + Date.now().toString()
            * def payloadLista = read('lista.json')
            And header X-JWT-Token = login.response.session.token
            And request payloadLista
            When method post
            Then status 201

        #Validando critérios de aceite 2
        #Scenario: Limite de uma lista de compras ativa por vez

        #Validando critérios de aceite 5
        Scenario: Criando nova lista de compras sem descrição
            * def descricaoDaListaAleatoria = ""
            * def payloadLista = read('lista.json')
            And header X-JWT-Token = login.response.session.token
            And request payloadLista
            When method post
            Then status 201

        #Validando critérios de aceite 6
        #Scenario: Limite mínimo da quantidade dos itens da lista de compras

        #Validando critérios de aceite 7
        #Scenario: Limite máximo da quantidade dos itens da lista de compras
