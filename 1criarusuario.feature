Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar o site e entrar na tela de registro
        Given que acessei o site Lembra Compras
        And acessei a tela de registro

        Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
            When preencho os campos necessários para cadastro
            | nome            | anna          |
            | e-mail          | anna@anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |

        Scenario: Não deve ser possível cadastrar usuário com e-mail inválido
            When preencho os campos necessários para cadastro
            | nome            | anna          |
            | e-mail          | anna.anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
            When preencho os campos de cadastro
            | nome            | nana          |
            | e-mail          | anna@anna.com |
            | senha           | 1234568       |
            | confirmar senha | 1234568       | 
            Then visualizo a mensagem de erro
            | mensagem | Este e-mail já é utilizado por outro usuário. |

        Scenario: É possível cadastrar usuário com caractere inválido
            When preencho os campos de cadastro        
            | nome            | anna          |
            | e-mail          | ann%@anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |

        Scenario: É possível cadastrar e-mail com mais de 60 caracteres
            When preencho os campos de cadastro        
            | nome            | anna                                                            |
            | e-mail          | annaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com |
            | senha           | 1234                                                            |
            | confirmar senha | 1234                                                            | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |