import { perfil_Page } from '../pages/perfilPage.po';

Given("que acessei o site Lembra compras", () => {

});

Given("loguei no site", (tabela) => {
    var usuario = tabela.rowsHash();
    // Cadastrando usuário para efetuar login
    loginPage.acessarCadastroUsuario();
    cadastrarPage.preenchoDadosCadastro(usuario);
    cy.interceptCadastrarUsuario();
    cadastrarPage.clicarBotaoCadastrar();

    // Efetuando login
    loginPage.preenchoDadosLogin(usuario);
    cy.interceptLogin();
    loginPage.clicarBotaoEntrar();
});

Given("acessei a tela de perfil", () => {
    listaPage.acessarTelaPerfil();
});

When("deixo o campo nome em branco", () => {
    perfil_Page.apagarNome();
});

When("deixo o campo email em branco", () => {
    perfil_Page.apagarEmail();
});

When("preencho o campo nome", (tabela) => {
    var nome = tabela.rowsHash();
    perfil_Page.atualizarNome(nome);
    perfil_Page.confirmarAlteracoes();
});

When("preencho o campo E-mail", (tabela) => {
    var email = tabela.rowsHash();
    perfil_Page.atualizarEmail(email)
    perfil_Page.confirmarAlteracoes();
});

Then("visualizo uma mensagem de erro", () => {
    var mensagem = tabela.rowsHash();
    cy.visualizarMensagem(mensagem);
});

Then("visualizo uma mensagem de sucesso", (tabela) => {
    var mensagem = tabela.rowsHash();
    cy.visualizarMensagem(mensagem);
});

When("preencho o campo E-mail com um E-mail já utilizado", (tabela) => {
    var email = tabela.rowsHash();
    perfil_Page.atualizarEmail(email)
    perfil_Page.interceptEmailExistente();
    perfil_Page.confirmarAlteracoes();
});

When("preencho o campo E-mail com um E-mail inválido", (tabela) => {
    var email = tabela.rowsHash();
    perfil_Page.atualizarEmail(email);
    perfil_Page.interceptEmailInvalido();
    perfil_Page.confirmarAlteracoes();
});

When("preencho o campo nome com um nome inválido", (tabela) => {
    var nome = tabela.rowsHash();
    perfil_Page.atualizarNome(nome);
    perfil_Page.interceptNomeInvalido();
    perfil_Page.confirmarAlteracoes();
});