Funcionalidade: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Contexto: Tenho um usuário cadastrado no sistema e estou na tela de login
        Dado que estou na tela de cadastro
        E cadastro um usuário
        | e-mail | ra@ro.com |
        | senha  | raro      |
        | nome   | ra        |
        E acesso a tela de login

        Cenário: Login sem preencher e-mail e senha
            Quando clico no botão
            | botão | Entrar |
            Então visualizo uma mensagem de erro 
            | mensagem | Informe seu e-mail |
            E visualizo uma mensagem de erro
            | mensagem | Informe sua senha | 

        Cenário: Login sem preencher o campo e-mail
            Quando informo uma senha
            | senha | 123456 |
            E clico no botão
            | botão | Entrar |
            Então visualizo uma mensagem de erro
            | mensagem | Informe seu e-mail |

        Cenário: Login sem preencher o campo senha
            Quando informo um e-mail
            | e-mail| ra@ro.com |
            E clico no botão
            | botão | Entrar |
            Então visualizo uma mensagem de erro
            | mensagem | Informe sua senha |

        Cenário: Login com e-mail inválido
            Quando informo um e-mail
            | e-mail | inva@lido.com |
            E informo uma senha
            | senha | 123456 |
            E clico no botão
            | botão | Entrar |
            Então visualizo uma mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Cenário: Login com senha inválida
            Quando informo um e-mail
            | e-mail| ra@ro.com |
            E informo uma senha
            | senha | 123 |
            E clico no botão
            | botão | Entrar |
            Então visualizo uma mensagem de erro
            | mensagem | E-mail ou senha incorretos. |

        Cenário: Login com usuário válido
            Quando informo um e-mail
            | e-mail| ra@ro.com |
            E informo uma senha
            | senha| raro |
            E clico no botão
            | botão | Entrar |
            Então sou autentificado e tenho acesso às demais funcionalidades do site

        Cenário: Ir para a tela de registrar usuário
            Quando clico no link
            | link | Registre-se |
            Então sou redirecionado para a tela de cadastro