Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acessar e logar no site
        Given que acessei o site Lembra Compras
        And loguei com email e senha válidos
      # | email | bruno@gmail.com |
      # | senha | bruno           |
        And criei listas de compras
        And acessei o histórico

        Scenario: Deve ser possível acessar o histórico da lista de compras
            When consulto o histórico da lista de compras
            Then visualizo o histórico da lista de compras 

        Scenario: Deve ser possível visualizar o nome e os itens de uma lista no histórico    
            When clico na lista de compras do histórico
            Then visualizo o nome e os itens dentro da lista
            | nomeLista  | Compras da páscoa |  
            | itens      | Ovo de páscoa     |
            | quantidade | 3                 |

        Scenario: O nome da lista e data de criação devem ser visíveis para o usuário no histórico
            When consulto o histórico da lista de compras
            Then visualizo o histórico da lista de compras com o nome e a data de criação
            | nomeDaLista   | Compras da páscoa     |
            | dataDeCriacao | Criada em: 18/05/2022 |

        