Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar o site e entrar na tela de registro
        Given que acessei o site Lembra Compras
        And acessei a tela de registro

        Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
            When preencho os campos de cadastro com dados válidos
            | nome           | Quebradores de API |
            | email          | grupo2@raro.lab    |
            | senha          | 1234568            |
            | confirmarSenha | 1234568            | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |

        Scenario Outline: Não deve ser possível cadastrar usuário com e-mail inválido
            When preencho os campos de cadastro com e-mail inválidos
            | nome           | <nome>           |
            | email          | <email>          |
            | senha          | <senha>          |
            | confirmarSenha | <confirmarSenha> |
            Then visualizo a mensagem de erro
            | mensagem | Formato de e-mail inválido |
            
            Examples:
                | nome               | email            | senha   | confirmarSenha |
                | Quebradores de API | grupo2.raro.lab  | 1234567 | 1234567        |
                | Quebradores de API | grupo2@rarolab   | 1234567 | 1234567        |
                | Quebradores de API | grupo&@raro.lab  | 1234567 | 1234567        |

        Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
            When preencho os campos de cadastro com e-mail já cadastrado
            | nome           | Quebradores de API |
            | email          | grupo2@raro.lab    |
            | senha          | 1234568            |
            | confirmarSenha | 1234568            | 
            Then visualizo a mensagem de erro
            | mensagem | Este e-mail já é utilizado por outro usuário. |

        Scenario Outline: Cadastrar dados inválidos
            When preencho os campos de cadastro com dados inválidos 
            | nome           | <nome>           |
            | email          | <email>          |
            | senha          | <senha>          |
            | confirmarSenha | <confirmarSenha> |
            Then visualizo a mensagem de erro
            | mensagem | <mensagem> |
            
            Examples:
                | nome                                                                                                           | email                                             | senha   | confirmarSenha | mensagem                                 |
                | Quebradores de API API API API API API API API API API API API API API API API API API API API API API API API | grupo2.raro.lab                                   | 1234567 | 1234567        | Informe no máximo 100 letras no seu nome |
                | Quebradores de API                                                                                             | grupogrupogrupogrupogrupogrupogrupogrupo@raro.lab | 1234567 | 1234567        | Informe no máximo 60 caracteres          |
                | Quebradores de API                                                                                             | grupo2@raro.lab                                   | 1234567 | 123456789      | As senhas não conferem.                  |

        Scenario: Cadastrar usuário sem nome, e-mail, senha e confirmar senha
            When cadastro usuário sem preencher os campos necessários
            Then visualizo a mensagem de erro
            | mensagem | Informe seu nome |
            Then visualizo a mensagem de erro
            | mensagem | Informe seu e-mail |
            Then visualizo a mensagem de erro
            | mensagem | Informe sua senha |
            
        Scenario: Cadastrar usuário com e-mail menor que 4 caracteres
            When preencho os campos de cadastro com e-mail menor que 4 caracteres
            | nome           | Quebradores de API |
            | email          | gru                |
            | senha          | 1234568            |
            | confirmarSenha | 1234568            | 
            Then visualizo a mensagem de erro
            | mensagem | Informe um e-mail válido |
        
        Scenario: Cadastrar usuário com nome menor que 4 caracteres
            When preencho os campos de cadastro com o campo nome de 4 caracteres
            | nome           | API                |
            | email          | grupo2@raro.lab    |
            | senha          | 1234568            |
            | confirmarSenha | 1234568            | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |

        Scenario: Visualizar a senha
            When preencho os campos de cadastro
            | nome           | Quebradores de API |
            | email          | grupo2@raro.lab    |
            | senha          | 12345689           |
            | confirmarSenha | 1234568            |  
            And clico no botão para visualizar a senha
            Then visualizo a minha senha
            | senha          | 12345689 |
            And visualizo a minha confirmação de senha
            | confirmarSenha | 1234568 |