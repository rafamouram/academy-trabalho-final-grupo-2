Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar

    Background: Acesso a API
        Given url baseUrl
        And path "/list"
        * def usuario = call read("hook.feature@CadastrarUsuario")
        * def login = call read("hook.feature@LoginUsuario")

    #Validando critérios de aceite 1, 3, 4
    Scenario: Criando nova lista de compras com descrição
        * def descricaoDaListaAleatoria = "Lista " + Date.now().toString()
        * def payloadLista = read('lista.json')

        And header X-JWT-Token = login.response.session.token
        And request payloadLista
        When method post
        Then status 201

    #Validando critérios de aceite 2
    Scenario: Uma lista de compras ativa
        * def criarLista = call read("hook.feature@CriarLista")

        And header X-JWT-Token = login.response.session.token
        When method GET
        Then status 200
        And match response == "#object"

    #Validando critérios de aceite 5
    Scenario: Criando nova lista de compras sem descrição
        * def descricaoDaListaAleatoria = ""
        * def payloadLista = read('lista.json')

        And header X-JWT-Token = login.response.session.token
        And request payloadLista
        When method post
        Then status 201

    #Validando critérios de aceite 6
    Scenario: Limite mínimo da quantidade dos itens da lista de compras
        * def criarLista = call read("hook.feature@CriarLista")
        * def lista = call read("hook.feature@RetornarListaAtiva")

        * def nomeItem = "exemplo"
        * def qtdItem = 0
        * def payloadItem = read('item.json')
        And header X-JWT-Token = login.response.session.token
        And path "item"
        And request payloadItem
        When method post
        Then status 400
        And match response contains { error: "Bad request."}

    #Validando critérios de aceite 7
    Scenario: Limite máximo da quantidade dos itens da lista de compras
        * def criarLista = call read("hook.feature@CriarLista")
        * def lista = call read("hook.feature@RetornarListaAtiva")

        * def nomeItem = "exemplo"
        * def qtdItem = 1001
        * def payloadItem = read('item.json')
        And header X-JWT-Token = login.response.session.token
        And path "item"
        And request payloadItem
        When method post
        Then status 422
        And match response contains { error: "Max item amount is 1000."}

#Validando critérios de aceite 8
    Scenario: Incluindo item já existente na lista de compras
        * def criarLista = call read("hook.feature@CriarLista")
        * def lista = call read("hook.feature@RetornarListaAtiva")

        #Guardo a quantidade inicial do primeiro item da lista
        * def qtdItemInicial = lista.response.items[0].amount

        #Guardo a quantidade que irei adicionar no primeiro item
        * def qtdAdicional = 3

        #Adiciono as variáveis de nome e quantidade a ser adicionada para o primeiro item
        * def nomeItem = lista.response.items[0].name
        * def qtdItem = qtdAdicional

        #Faço a chamada do hook para atualizar a quantidade do item
        And call read("hook.feature@CriarOuAtualizarItem")

        #Puxo a lista novamente para buscar o item com a quantidade atualizada
        * def novaLista = call read("hook.feature@RetornarListaAtiva")

        #Busca no array de itens o item que foi anteriormente alterado
        * def item = novaLista.response.items.find(data => data.name === nomeItem);

        #Guardo a quantidade final do item que teve sua quantidade alterada
        * def qtdItemFinal = item.amount

        #Comparo a soma da quantidade inicial + a quantidade adicional com a quantidade do item atualizado
        And match qtdItemInicial+qtdAdicional == qtdItemFinal

    #Validando critérios de aceite 9
    Scenario: Limite máximo da quantidade total atualizada de itens existentes na lista de compras
        * def criarLista = call read("hook.feature@CriarLista")
        * def lista = call read("hook.feature@RetornarListaAtiva")

        * def nomeItem = lista.response.items[0].name
        * def qtdItem = 1000
        * def payloadItem = read('item.json')
        And header X-JWT-Token = login.response.session.token
        And path "item"
        And request payloadItem
        When method post
        Then status 422
        And match response contains { error: "Max item amount is 1000."}

    #Validando critérios de aceite 11
    Scenario: Finalizando uma lista de compras
        * def criarLista = call read("hook.feature@CriarLista")

        And header X-JWT-Token = login.response.session.token
        When method PATCH
        Then status 204