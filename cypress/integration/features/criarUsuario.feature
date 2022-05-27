Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar o site e entrar na tela de registro
        Given que acessei o site Lembra Compras
        And acessei a tela de registro

        Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
            When preencho os campos de cadastro com dados válidos
            | nome           | anna          |
            | email          | annaa@ana.br  |
            | senha          | 1234567       |
            | confirmarSenha | 1234567       | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |

        Scenario Outline: Não deve ser possível cadastrar usuário com e-mail inválido
            When preencho os campos de cadastro com e-mail inválidos
            Then visualizo a mensagem de erro
            | mensagem | Formato de e-mail inválido |
            
            Example: Example name
            | nome | e-mail        | senha   | confirmar senha |
            | anna | anna.anna.com | 1234567 | 1234567         |
            | anna | anna@anna     | 1234567 | 1234567         |
            | anna | ann%@anna.com | 1234567 | 1234567         |
            | anna | ann%@anna.com | 1234567 | 1234567         |

        Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
            When preencho os campos de cadastro com e-mail já cadastrado
            | nome           | nana          |
            | email          | anna@anna.com |
            | senha          | 1234568       |
            | confirmarSenha | 1234568       | 
            Then visualizo a mensagem de erro
            | mensagem | Este e-mail já é utilizado por outro usuário. |

        

        Scenario: Cadastrar com e-mail com mais de 60 caracteres
            When preencho os campos de cadastro com dados inválidos       
            | nome           | anna                                                            |
            | email          | annaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com |
            | senha          | 1234                                                            |
            | confirmarSenha | 1234                                                            | 
            Then visualizo a mensagem de erro
            | mensagem | Informe no máximo 60 caracteres no seu e-mail |
        
        Scenario: Cadastrar com nome com mais de 100 letras
            When preencho os campos de cadastro com dados inválidos
            | nome           | annaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaannaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com | 
            | email          | anna@anna.com                                                                                                        |
            | senha          | 1234567                                                                                                              |
            | confirmarSenha | 1234567                                                                                                              | 
            Then visualizo a mensagem de erro
            | mensagem | Informe no máximo 100 letras no seu nome |

        Scenario: Cadastrar usuário sem nome, e-mail, senha e confirmar senha
            When cadastro usuário sem preencher os campos necessários
            Then visualizo a mensagem de erro
            | mensagem | Informe seu nome |
            Then visualizo a mensagem de erro
            | mensagem | Informe seu e-mail |
            Then visualizo a mensagem de erro
            | mensagem | Informe sua senha |
            Then visualizo a mensagem de erro
            | mensagem | Informe sua confirmação de senha |

        Scenario: Cadastrar usuário com senha diferente da confirmação de senha
            When preencho os campos de cadastro com dados inválidos
            | nome           | anna          |
            | email          | anna@anna.com |
            | senha          | 1234567       |
            | confirmarSenha | 1234568       | 
            Then visualizo a mensagem de erro
            | mensagem | As senhas não conferem. |
            
        Scenario: Cadastrar usuário com e-mail menor que 4 caracteres
            When preencho os campos de cadastro com e-mail menor que o permitido
            | nome           | anna         |
            | email          | ann          |
            | senha          | 1234567      |
            | confirmarSenha | 1234567      | 
            Then visualizo a mensagem de erro
            | mensagem | Informe seu e-mail completo |
        
        Scenario: Cadastrar usuário com senha menor que 4 caracteres
            When preencho os campos de cadastro com a senha menor que o permitido
            | nome           | ann           |
            | email          | anna@anna.com |
            | senha          | 123           |
            | confirmarSenha | 123           | 
            Then visualizo a mensagem de erro
            | mensagem | Informe seu nome completo |

        Scenario: Visualizar a senha
            When preencho os campos de cadastro
            | nome           | anna          |
            | email          | anna@anna.com |
            | senha          | 123           |
            | confirmarSenha | 123           | 
            And clico no botão para visualizar a senha
            And clico no botão para visualizar a confirmação de senha
            Then visualizo a minha senha

        # # Scenario: Voltar para a tela de login
        # #     When clico para voltar para a tela de login
        # #     Then visualizo a tela de login