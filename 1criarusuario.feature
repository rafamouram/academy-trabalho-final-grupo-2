Scenario: Cadastrar usuário com nome, e-mail e senha
    Given que entrei no site "Lembra Compras"
    And cliquei no botão "Registre-se"
    When preencho os campos "nome", "e-mail" e "senha"
    And preencho o campo "confirmar senha" com a mesma senha
    And clico no botão "Registrar"
    Then realizo o cadastro de um novo usuário

Scenario: Cadastrar usuário com e-mail no formato padrão
    Given que entrei no site "Lembra Compras"
    And cliquei no botão "Registre-se"
    When preencho os campos "nome", "e-mail" e "senha"
    And preencho com um e-mail válido
    And clico no botão "Registrar"
    Then o cadastro é realizado

Scenario: Não deve ser possível cadastrar usuário com e-mail inválido
    Given que entrei no site "Lembra Compras"
    And cliquei no botão  "Registre-se"
    When preencho os campos de cadastro
    And preencho com um e-mail inválido
    And clico no botão "Registrar"
    Then a operação de cadastro é cancelada

Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
    Given que entrei no site "Lembra Compras"
    And cliquei no botão "Registre-se"
    When preencho os campos de cadastro
    And preencho o campo de "e-mail" com um e-mail já cadastrado
    And clico no botão "Registrar"
    Then recebo a mensagem "User already exists"
    And não consigo finalizar o cadastro