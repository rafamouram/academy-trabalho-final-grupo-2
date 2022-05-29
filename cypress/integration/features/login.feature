Feature: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Background: Tenho um usuário cadastrado no sistema e estou na tela de login
        Given acessei o site Lembra Compras

        Scenario: Login sem preencher e-mail e senha
            When tento fazer login sem preencher os dados e-mail e senha
            Then visualizo uma mensagem de erro 
            | mensagem | Informe seu e-mail |
            And visualizo uma mensagem de erro
            | mensagem | Informe sua senha  | 

        Scenario: Login sem preencher o campo e-mail
            When informo uma senha
            | senha | 123456 |
            Then visualizo uma mensagem de erro
            | mensagem | Informe seu e-mail |

        Scenario: Login sem preencher o campo senha
            When informo um e-mail
            | email | ra@ro.com |
            Then visualizo uma mensagem de erro
            | mensagem | Informe sua senha |

        Scenario: Login com e-mail inválido
            When informo um e-mail e senha
            | email | inva@lido.c |
            | senha | 123456      |
            Then visualizo uma mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Scenario: Login com e-mail inexistente
           When informo um e-mail inexistente e senha
            | email | wwww@ro.com |
            | senha | 123         |
            Then visualizo uma mensagem de erro
            | mensagem | E-mail ou senha incorretos. |

        Scenario: Login com senha não correspondente ao e-mail
            When informo um e-mail e senha não correspondentes
            | email | ra@ro.com |
            | senha | 123       |
            Then visualizo uma mensagem de erro
            | mensagem | E-mail ou senha incorretos. |

        Scenario: Login com usuário válido
            When informo um e-mail e senha válidos
            | email | ra@ro.com |
            | senha | raro      |
            Then sou autentificado e tenho acesso às demais funcionalidades do site
