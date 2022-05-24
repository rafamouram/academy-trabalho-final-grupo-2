Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar o site e entrar na tela de registro
        Given que acessei o site Lembra Compras
        And acessei a tela de registro

        Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
            When preencho os campos de cadastro com dados válidos
            | nome            | anna          |
            | e-mail          | anna@anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de sucesso
            | mensagem | Usuário criado com sucesso! |

        Scenario: Não deve ser possível cadastrar usuário com e-mail sem @
            When preencho os campos de cadastro com dados inválidos
            | nome            | anna          |
            | e-mail          | anna.anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Scenario: Não deve ser possível cadastrar usuário com e-mail sem .
            When preencho os campos de cadastro com dados inválidos
            | nome            | anna          |
            | e-mail          | anna@anna     |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de erro
            | mensagem | Formato de e-mail inválido. |

        Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
            When preencho os campos de cadastro com e-mail já cadastrado
            | nome            | nana          |
            | e-mail          | anna@anna.com |
            | senha           | 1234568       |
            | confirmar senha | 1234568       | 
            Then visualizo a mensagem de erro
            | mensagem | Este e-mail já é utilizado por outro usuário. |

        Scenario: Cadastrar usuário com e-mail com caractere inválido
            When preencho os campos de cadastro com dados inválidos       
            | nome            | anna          |
            | e-mail          | ann%@anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234567       | 
            Then visualizo a mensagem de sucesso
            | mensagem | Formato de e-mail inválido |

        Scenario: Cadastrar com e-mail com mais de 60 caracteres
            When preencho os campos de cadastro com dados inválidos       
            | nome            | anna                                                            |
            | e-mail          | annaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com |
            | senha           | 1234                                                            |
            | confirmar senha | 1234                                                            | 
            Then visualizo a mensagem de erro
            | mensagem | Informe no máximo 60 caracteres no seu e-mail |
        
        Scenario: Cadastrar com nome com mais de 100 letras
            When preencho os campos de cadastro com dados inválidos
            | nome            | annaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaannaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com | 
            | e-mail          | anna@anna.com                                                                                                        |
            | senha           | 1234567                                                                                                              |
            | confirmar senha | 1234567                                                                                                              | 
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
            | nome            | anna          |
            | e-mail          | anna@anna.com |
            | senha           | 1234567       |
            | confirmar senha | 1234568       | 
            Then visualizo a mensagem de erro
            | mensagem | As senhas não conferem. |

        Scenario: Cadastrar usuário com senha com menos de 4 caracteres
            When preencho os campos de cadastro com dados inválidos
            | nome            | ann           |
            | e-mail          | anna@anna.com |
            | senha           | 123           |
            | confirmar senha | 123           | 
            Then visualizo a mensagem de erro
            | mensagem | Informe seu nome completo |

        Scenario: Cadastrar usuário com e-mail com menos de 4 caracteres
            When preencho os campos de cadastro com dados inválidos
            | nome            | anna         |
            | e-mail          | ann          |
            | senha           | 1234567      |
            | confirmar senha | 1234567      | 
            Then visualizo a mensagem de erro
            | mensagem | Informe seu e-mail completo |

        Scenario: Visualizar a senha
            When preencho os campos de cadastro
            | nome            | anna          |
            | e-mail          | anna@anna.com |
            | senha           | 123           |
            | confirmar senha | 123           | 
            And clico no botão para visualizar a senha
            Then visualizo a minha senha
            | senha | 123 | 

        Scenario: Visualizar a confirmação de senha
            When preencho os campos de cadastro
            | nome            | anna           |
            | e-mail          | anna@anna.com |
            | senha           | 123           |
            | confirmar senha | 123           |
            And clico no botão para visualizar a confirmação de senha
            Then visualizo a minha confirmação de senha
            | confirmar senha | 123 |

        # Scenario: Voltar para a tela de login
        #     When clico para voltar para a tela de login
        #     Then visualizo a tela de login