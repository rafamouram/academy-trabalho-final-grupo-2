Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acessar e logar no site
        Given que acessei o site Lembra Compras
        And loguei no site
        | email | bruno@gmail.com |
        | senha | bruno           |
        And criei listas de compras
        And acessei o histórico

        Scenario: É possível visualizar apenas as 10 listas mais recentes no histórico
            Then visualizo o histórico com apenas as 10 listas mais recentes

        Scenario: É possível visualizar o nome e os itens de uma lista no histórico    
            When clico na lista de compras do histórico
            Then visualizo o nome da lista e os itens dentro desta
            | nomeLista  | Compras da páscoa |  
            | itens      | Ovo de páscoa     |
            | quantidade | 3                 |

        Scenario: O nome da lista e data de criação devem ser visíveis para o usuário no histórico
            When consulto o histórico da lista de compras
            Then visualizo o histórico da lista de compras com o nome e a data de criação
            | nomeDaLista   | Compras da páscoa     |
            | dataDeCriacao | Criada em: 18/05/2022 |

        Scenario: É possível deslogar do site Lembra Compras após consultar o histórico 
            When clico no menu do Lembra Compras
            And clico para sair da conta
            Then sou redirecionado para a tela de login

        Scenario: Navegar para a lista através do menu após consultar o histórico 
            When clico no menu do Lembra Compras
            And clico para acessar uma lista
            Then sou redirecionado para a página da lista de compras

        Scenario: Acessar o perfil de usuário através do menu após consultar o histórico
            When clico no menu do Lembra Compras
            And clico para acessar o perfil de usuário
            Then sou redirecionado para a tela do perfil do usuário

        Scenario: Navegar para a lista de compras através do cabeçalho após consultar o histórico
            When clico na lista de compras
            Then sou redirecionado para a página da lista de compras

        Scenario: Navegar para o histórico através do cabeçalho estando no histórico de uma lista de compras
            When clico para acessar uma lista
            And clico no histórico
            Then sou redirecionado para a página do histórico

        Scenario: Navegar para o histórico através do menu estando no histórico de uma lista de compras
            When clico para acessar uma lista
            And clico no menu do Lembra Compras
            And clico para acessar o histórico
            Then sou redirecionado para a página do histórico
        