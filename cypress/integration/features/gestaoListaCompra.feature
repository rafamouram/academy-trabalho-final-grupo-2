Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar

        #Condição para todos os cenários
        Background: Acessando a aplicação Lembra Compras
            Given que acessei o site Lembra Compras
            And loguei com um usuário
            | email | grupo2raro@gemil.com |
            | senha | grupo2raro           |

            #Validando critérios de aceite 1, 3, 4
            Scenario: Criando nova lista de compras com descrição
                When preencho a descrição da lista de compras
                | descricao | compra da semana |
                And incluo uma lista de itens na lista de compras
                | nome       | feijão 500g | oleo 1L | arroz 5kg | macarrão Nº8 |
                | quantidade | 2           | 1       | 1         | 2            |
                Then visualizo a mensagem de sucesso
                | mensagem | Lista de compras criada com sucesso |

            #Validando critérios de aceite 2
            Scenario: Limite de uma lista de compras ativa por vez
                When possuo uma lista de compras salva
                Then visualizo a opção de marcar um item como concluído
                And visualizo a opção de incluir um novo item
                And visualizo a opção de finalizar a lista

            #Validando critérios de aceite 5
            Scenario: Criando nova lista de compras sem descrição
                When incluo uma lista de itens na lista de compras
                | nome       | feijão 500g | oleo 1L | arroz 5kg | macarrão Nº8 |
                | quantidade | 2           | 1       | 1         | 2            |
                Then visualizo a mensagem de sucesso
                | mensagem | Lista de compras criada com sucesso |
            
            Scenario: Criando nova lista de compras sem itens
                When salvo a lista de compras sem incluir itens
                Then visualizo a mensagem de erro
                | mensagem | Adicione pelo menos um item na sua lista de compras |

            #Validando critérios de aceite 6
            Scenario: Limite mínimo da quantidade dos itens da lista de compras
                When possuo uma lista de compras salva
                And incluo um item na lista de compras
                | item       | alho 200g |
                | quantidade | 0         |
                Then visualizo a mensagem de erro
                | mensagem | Informe pelo menos 1 unidade |

            #Validando critérios de aceite 7
            Scenario: Limite máximo da quantidade dos itens da lista de compras
                When possuo uma lista de compras salva
                And incluo um item na lista de compras
                | item       | ovo pente |
                | quantidade | 1001      |
                Then visualizo a mensagem de erro
                | mensagem | Informe uma quantidade menor ou igual a 1000 |

            #Validando critérios de aceite 8
            Scenario: Incluindo item já existente na lista de compras
                When possuo uma lista de compras salva
                And incluo um item na lista de compras
                | item       | iorgute 1L |
                | quantidade | 2          |
                Then é acrescentada na quantidade do item já incluso anteriormente a lista de compras ativa
                And visualizo a mensagem de sucesso
                | mensagem | Item adicionado com com sucesso |

            #Validando critérios de aceite 9
            Scenario: Limite máximo da quantidade total atualizada de itens existentes na lista de compras
                When possuo uma lista de compras salva
                And incluo um item na lista de compras
                | item       | iorgute 1L |
                | quantidade | 1001       |
                Then visualizo a mensagem de erro
                | mensagem | Não é permitido incluir mais de 1000 unidades do produto |

            #Validando critérios de aceite 10
            Scenario: Marcando item como concluído na lista de compras
                When possuo uma lista de compras salva
                And marco o item como concluído na lista de compra
                Then visualizo o item marcado com um risco cortando o seu nome

            #Validando critérios de aceite 11
            Scenario: Finalizando uma lista de compras
                When possuo uma lista de compras salva
                And finalizo a lista de compra
                Then visualizo a mensagem de sucesso
                | mensagem | Lista concluída com sucesso |

            Scenario: Incluindo item com nome com menos de 2 caracteres
                When incluo um item na lista de compras
                | item       | a |
                | quantidade | 2 |
                Then visualizo a mensagem de sucesso
                | mensagem | Informe o nome do produto |

            # Scenario: Deslogar do site Lembra Compras 
            #     When clico no menu do Lembra Compras
            #     And clico para sair da conta
            #     Then sou redirecionado para a tela de login

            # Scenario: Navegar para o histórico através menu
            #     When clico no menu de Lembra Compras
            #     And clico no histórico
            #     Then sou redirecionado para a página do histórico

            # Scenario: Navegar para o histórico através do cabeçalho
            #     When clico no histórico
            #     Then sou redirecionado para a página do histórico

            # Scenario: Navegar para o histórico através do cabeçalho
            #     When clico no perfil
            #     Then sou redirecionado para a página do perfil do usuário

            # Scenario: Navegar para a lista atráves do ícone "R" do site
            #     When clico no ícone R
            #     Then sou redirecionado para a página da lista de compras

            # Scenario: Navegar para a lista atráves do ícone "Lembra Compras" do site
            #     When clico no ícone Lembra compras
            #     Then sou redirecionado para a página da lista de compras        