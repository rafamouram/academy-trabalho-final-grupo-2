Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar

#Condição para todos os cenários
    Background: Acesso a aplicação Lembra Compras
        Given Acessei a aplicação Lembra Compras
        And Loguei com um usuário
        |email | grupo2raro@gemil.com |
        |senha | grupo2raro           |

#Validando critérios de aceite 1, 3, 4
    Scenario: Criando nova lista de compras com descrição
        When Preencho a descricao da lista de compras
        |descricao |compra da semana |
        And Incluo uma lista de itens na minha lista de compras
        |nome       |feijão 500g |oleo 1L |arroz 5kg |macarrão Nº8 |
        |quantidade |2           |1       |1         |2            |
        Then Visualizo a mensagem "Lista de compras criada com sucesso"


#Validando critérios de aceite 2
    Scenario: Limite de uma lista de compras ativa por vez
        When Possuo uma lista de compras ativa
        Then Visualizo a opção de marcar um item como concluído
        And Visualizo a opção de incluir um novo item
        And Visualizo a opção de finalizar a lista

#Validando critérios de aceite 5
    Scenario: Criando nova lista de compras sem descrição
        When Incluo uma lista de itens na minha lista de compras sem preencher a descrição da lista
        |nome       |feijão 500g |oleo 1L |arroz 5kg |macarrão Nº8 |
        |quantidade |2           |1       |1         |2            |
        Then Visualizo a mensagem "Lista de compras criada com sucesso"

#Validando critérios de aceite 6
    Scenario: Limite mínimo da quantidade dos itens da lista de compras
        When Possuo uma lista de compras ativa
        And Incluo a quantidade de um item menor que 1
        |item       |alho 200g |
        |quantidade |0         |
        Then Visualizo a mensagem "Informe pelo menos 1 unidade"

#Validando critérios de aceite 7
    Scenario: Limite máximo da quantidade dos itens da lista de compras
        When Possuo uma lista de compras ativa
        And Incluo a quantidade de um item maior que 1000
        |item       |ovo pente |
        |quantidade |1001      |
        Then Visualizo a mensagem "Informe uma quantidade menor ou igual a 1000"

#Validando critérios de aceite 8
    Scenario: Incluindo item já existente na lista de compras
        When Possuo uma lista de compras ativa
        And Incluo um item com o mesmo nome de um item já existente na lista de compras ativa
        |item       |iorgute 1L |
        |quantidade |2          |
        Then É acrescentada na quantidade do item já incluso anteriormente a lista de compras ativa
        And Visualizo a mensagem "Item adicionado com com sucesso"

#Validando critérios de aceite 9
    Scenario: Limite máximo da quantidade total atualizada de itens da lista de compras
        When Possuo uma lista de compras ativa
        And Incluo um item com o mesmo nome de um item já existente na lista de compras ativa tornando o total atualizado superior a mil
        |item       |iorgute 1L |
        |quantidade |1001       |
        Then Visualizo a mensagem "Não é permitido incluir mais de 1000 unidades do produto"

#Validando critérios de aceite 10
    Scenario: Marcando item como concluído na lista de compras
        When Possuo uma lista de compras ativa
        And Marco o item como concluído na lista de compra
        Then Visualizo o item marcado com um risco cortando o seu nome

#Validando critérios de aceite 11
    Scenario: Finalizando uma lista de compras
        When Possuo uma lista de compras ativa
        And Finalizo a lista de compra
        Then Visualizo a mensagem "Lista concluída com sucesso"
        And Visualizo as listas finalizadas na tela de histórico