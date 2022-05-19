Feature: Login
    Feature Description: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Background: Tenho um usuário cadastrado no sistema e estou na tela de login
        Given acessei o site Lembra Compras
        And cadastro um usuário
        | e-mail | ra@ro.com |
        | senha  | raro      |
        | nome   | ra        |
        And acesso a tela de login

        Scenario: Login sem preencher e-mail e senha
            When tento fazer login sem preencher os dados e-mail e senha
            Then visualizo uma mensagem de erro 
            | mensagem | Informe seu e-mail |
            And visualizo uma mensagem de erro
            | mensagem | Informe sua senha | 

        Scenario: Login sem preencher o campo e-mail
            When informo uma senha
            | senha | 123456 |
            Then visualizo uma mensagem de erro
            | mensagem | Informe seu e-mail |

        Scenario: Login sem preencher o campo senha
            When informo um e-mail e senha
            | e-mail | ra@ro.com |
            | botão  | Entrar    |
            Then visualizo uma mensagem de erro
            | mensagem | Informe sua senha |

        Scenario: Login com e-mail inválido
            When informo um e-mail e senha
            | e-mail | inva@lido.com |
            | senha  | 123456        |
            Then visualizo uma mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Scenario: Login com senha inválida
            When informo um e-mail e senha
            | e-mail | ra@ro.com |
            | senha  | 123       |
            Then visualizo uma mensagem de erro
            | mensagem | E-mail ou senha incorretos. |

        Scenario: Login com usuário válido
            When informo um e-mail e senha
            | e-mail | ra@ro.com |
            | senha  | raro      |
            Then sou autentificado e tenho acesso às demais funcionalidades do site

        Scenario: Ir para a tela de registrar usuário
            When acesso a tela de registro
            Then visualizo a tela de registro