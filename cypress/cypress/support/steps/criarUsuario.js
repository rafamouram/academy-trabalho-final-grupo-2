import { criarUsuario } from "../pages/criarUsuario.po";

//Background: Acessar o site e entrar na tela de registro
Given("que acessei o site Lembra Compras", () => {
    criarUsuario.acesso()
});

And("acessei a tela de registro", () => {
    cy.contains("Registre-se").click()
})

//Scenario: Cadastrar usuário com nome, e-mail, senha e confirmar senha
When("preencho os campos de cadastro com dados válidos", (tabela) => {
    criarUsuario.usuarioCadastrado();
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
    cy.contains("Registrar").click()
});

Then("visualizo a mensagem de sucesso", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    cy.contains(dadosTabela.mensagem).should('be.visible')
    criarUsuario.validarPagLogin()
});

//Scenario Outline: Não deve ser possível cadastrar usuário com e-mail inválido
When("preencho os campos de cadastro com e-mail inválidos", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
    cy.contains("Registrar").click()
});

Then("visualizo a mensagem de erro", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    cy.contains(dadosTabela.mensagem).should('be.visible')
});

//Scenario: Não deve ser possível cadastrar usuário com e-mail já cadastrado
When("preencho os campos de cadastro com e-mail já cadastrado", (tabela) => {
    criarUsuario.usuarioExistente();
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
    cy.contains("Registrar").click()
});

//Scenario: Cadastrar com e-mail com mais de 60 caracteres
//Scenario: Cadastrar com nome com mais de 100 letras
//Scenario: Cadastrar usuário com senha diferente da confirmação de senha
When("preencho os campos de cadastro com dados inválidos", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
    cy.contains("Registrar").click()
});

//Scenario: Cadastrar usuário sem nome, e-mail, senha e confirmar senha
When("cadastro usuário sem preencher os campos necessários", () => {
    cy.contains("Registrar").click()
});

//Scenario: Cadastrar usuário com e-mail menor que 4 caracteres
When("preencho os campos de cadastro com e-mail menor que 4 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
    cy.contains("Registrar").click()
});

//Scenario: Cadastrar usuário com nome menor que 4 caracteres
When("preencho os campos de cadastro com o campo nome de 4 caracteres", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
    cy.contains("Registrar").click()
});

//Scenario: Visualizar a senha
When("preencho os campos de cadastro", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    criarUsuario.preencherCampos(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmarSenha)
});

And("clico no botão para visualizar a senha", () => {
    cy.get("[width='1em']").click({ multiple: true })
});

Then("visualizo a minha senha", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    cy.get("[name='password']").should('have.value', dadosTabela.senha)
});

And("visualizo a minha confirmação de senha", (tabela) => {
    var dadosTabela = tabela.rowsHash()
    cy.get("[name='confirmPassword']").should('have.value', dadosTabela.confirmarSenha)
    cy.contains("Voltar").click()
    criarUsuario.validarPagLogin()
});