Funcionalidade: Login
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Contexto: Estou na tela de login
        Dado que estou na tela de login

        Cenário: Login sem preencher e-mail e senha
            Quando clico no botão Entrar
            Então visualizo uma mensagem de erro de preenchimento de campos obrigatórios


        Cenário: Login sem preencher o campo e-mail
            Quando informo uma senha válida
            E clico no botão Entrar
            Então visualizo uma mensagem de erro de e-mail obrigatório

        Cenário: Login sem preencher o campo senha
            Quando informo um e-mail válido
            E clico no botão Entrar
            Então visualizo uma mensagem de erro de senha obrigatória

        Cenário: Login com e-mail inválido
            Quando informo um e-mail inválido
            E informo uma senha válida
            E clico no botão Entrar
            Então visualizo uma mensagem de erro de e-mail inválido


        Cenário: Login com senha inválida
            Quando informo um e-mail válido
            E informo uma senha inválida
            E clico no botão Entrar
            Então visualizo uma mensagem de erro de senha inválida
 

        Cenário: Login com usuário válido
            Quando informo um e-mail válido
            E informo uma senha válida
            E clico no botão salvar
            Então sou autentificado e tenho acesso às demais funcionalidades do site