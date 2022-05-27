import { criarUsuario } from "../pages/criarUsuario.po";

//Background: Acessar o site e entrar na tela de registro
    Given("que acessei o site Lembra Compras", () =>{
        criarUsuario.acesso()
    });

    And("acessei a tela de registro", () =>{
        cy.contains("Registre-se").click()
    })

//Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
    When("preencho os campos de cadastro com dados válidos", (tabela) =>{
        var dadosTabela = tabela.rowsHash()
        criarUsuario.cadastrar(dadosTabela.nome,dadosTabela.email,dadosTabela.senha,dadosTabela.confirmarSenha)
    });
    
    Then("visualizo a mensagem de sucesso", (tabela) =>{
        var dadosTabela = tabela.rowsHash()
        cy.contains(dadosTabela.mensagem).should('be.visible')
        criarUsuario.validarPagLogin()
    });