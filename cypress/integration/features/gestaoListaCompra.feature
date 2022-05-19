Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar

        #Condição para todos os cenários
        Background: Acesso a aplicação Lembra Compras
            Given que acessei o site Lembra Compras
            And loguei com um usuário
            |email | grupo2raro@gemil.com |
            |senha | grupo2raro           |

            #Validando critérios de aceite 1, 3, 4
            Scenario: Criando nova lista de compras com descrição
                When preencho a descricao da lista de compras
                |descricao |compra da semana |
                And incluo uma lista de itens na minha lista de compras
                |nome       |feijão 500g |oleo 1L |arroz 5kg |macarrão Nº8 |
                |quantidade |2           |1       |1         |2            |
                Then visualizo a mensagem "Lista de compras criada com sucesso"

            #Validando critérios de aceite 2
            Scenario: Limite de uma lista de compras ativa por vez
                When possuo uma lista de compras ativa
                Then visualizo a opção de marcar um item como concluído
                And visualizo a opção de incluir um novo item
                And visualizo a opção de finalizar a lista

            #Validando critérios de aceite 5
            Scenario: Criando nova lista de compras sem descrição
                When incluo uma lista de itens na minha lista de compras sem preencher a descrição da lista
                |nome       |feijão 500g |oleo 1L |arroz 5kg |macarrão Nº8 |
                |quantidade |2           |1       |1         |2            |
                Then visualizo a mensagem "Lista de compras criada com sucesso"

            #Validando critérios de aceite 6
            Scenario: Limite mínimo da quantidade dos itens da lista de compras
                When possuo uma lista de compras ativa
                And incluo a quantidade de um item menor que 1
                |item       |alho 200g |
                |quantidade |0         |
                Then visualizo a mensagem "Informe pelo menos 1 unidade"

            #Validando critérios de aceite 7
            Scenario: Limite máximo da quantidade dos itens da lista de compras
                When possuo uma lista de compras ativa
                And incluo a quantidade de um item maior que 1000
                |item       |ovo pente |
                |quantidade |1001      |
                Then visualizo a mensagem "Informe uma quantidade menor ou igual a 1000"

            #Validando critérios de aceite 8
            Scenario: Incluindo item já existente na lista de compras
                When possuo uma lista de compras ativa
                And incluo um item com o mesmo nome de um item já existente na lista de compras ativa
                |item       |iorgute 1L |
                |quantidade |2          |
                Then é acrescentada na quantidade do item já incluso anteriormente a lista de compras ativa
                And visualizo a mensagem "Item adicionado com com sucesso"

            #Validando critérios de aceite 9
            Scenario: Limite máximo da quantidade total atualizada de itens da lista de compras
                When possuo uma lista de compras ativa
                And incluo um item com o mesmo nome de um item já existente na lista de compras ativa tornando o total atualizado superior a mil
                |item       |iorgute 1L |
                |quantidade |1001       |
                Then visualizo a mensagem "Não é permitido incluir mais de 1000 unidades do produto"

            #Validando critérios de aceite 10
            Scenario: Marcando item como concluído na lista de compras
                When possuo uma lista de compras ativa
                And marco o item como concluído na lista de compra
                Then visualizo o item marcado com um risco cortando o seu nome

            #Validando critérios de aceite 11
            Scenario: Finalizando uma lista de compras
                When possuo uma lista de compras ativa
                And finalizo a lista de compra
                Then visualizo a mensagem "Lista concluída com sucesso"
                And visualizo as listas finalizadas na tela de histórico