Feature: Login
    Feature Description: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Background: Tenho um usuário cadastrado no sistema e estou na tela de login
        Given que estou na tela de cadastro
        And cadastro um usuário
        | e-mail | ra@ro.com |
        | senha  | raro      |
        | nome   | ra        |
        And acesso a tela de login

        Scenario: Login sem preencher e-mail e senha
            When clico no botão
            | botão | Entrar |
            Then visualizo uma mensagem de erro 
            | mensagem | Informe seu e-mail |
            And visualizo uma mensagem de erro
            | mensagem | Informe sua senha | 

        Scenario: Login sem preencher o campo e-mail
            When informo uma senha
            | senha | 123456 |
            And clico no botão
            | botão | Entrar |
            Then visualizo uma mensagem de erro
            | mensagem | Informe seu e-mail |

        Scenario: Login sem preencher o campo senha
            When informo um e-mail
            | e-mail| ra@ro.com |
            And clico no botão
            | botão | Entrar |
            Then visualizo uma mensagem de erro
            | mensagem | Informe sua senha |

        Scenario: Login com e-mail inválido
            When informo um e-mail
            | e-mail | inva@lido.com |
            And informo uma senha
            | senha | 123456 |
            And clico no botão
            | botão | Entrar |
            Then visualizo uma mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Scenario: Login com senha inválida
            When informo um e-mail
            | e-mail| ra@ro.com |
            And informo uma senha
            | senha | 123 |
            And clico no botão
            | botão | Entrar |
            Then visualizo uma mensagem de erro
            | mensagem | E-mail ou senha incorretos. |

        Scenario: Login com usuário válido
            When informo um e-mail
            | e-mail| ra@ro.com |
            And informo uma senha
            | senha| raro |
            And clico no botão
            | botão | Entrar |
            Then sou autentificado e tenho acesso às demais funcionalidades do site

        Scenario: Ir para a tela de registrar usuário
            When clico no link
            | link | Registre-se |
            Then sou redirecionado para a tela de cadastro