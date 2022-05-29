import { perfil_Page } from '../pages/perfilPage.po';

import { login_Page } from '../pages/loginPage.po';

import { lista_Page } from '../pages/gestaoListaCompra.po';

import { criarUsuario } from '../pages/criarUsuario.po';

before(() => {
    login_Page.acesso();
    var email = "grupo2@oni.com";
    var nome = "Cacadores de API";
    var senha = "1234";
    // Cadastrando usuário para efetuar login
    login_Page.acessarTelaCadastrar();
    criarUsuario.cadastrar(nome, email, senha, senha);
    criarUsuario.clicarBotaoRegistrar();

    // Efetuando login
    criarUsuario.acesso();
    login_Page.preenchoDadosLogin(email, senha);
    login_Page.clicarBotaoEntrar();
});

after(() => {
    perfil_Page.deslogarDoSite();
});


Given("acessei a tela de perfil", () => {
    lista_Page.acessarTelaPerfil();
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
    cy.contains("Minhas informações").click();
});

When("preencho o campo nome com apenas espaços", () => {
    perfil_Page.atualizarNomeEspacos();
    cy.contains("Minhas informações").click();
    perfil_Page.confirmarAlteracoes();
});

When("preencho o campo nome e confirmo", (tabela) => {
    var nome = tabela.rowsHash();
    perfil_Page.atualizarNome(nome);
    perfil_Page.confirmarAlteracoes();
});

When("preencho o campo E-mail", (tabela) => {
    var email = tabela.rowsHash();
    perfil_Page.atualizarEmail(email)
    cy.contains("Minhas informações").click();
});

When("preencho o campo E-mail e confirmo", (tabela) => {
    var email = tabela.rowsHash();
    perfil_Page.atualizarEmail(email)
    perfil_Page.interceptEmailValido();
    perfil_Page.confirmarAlteracoes();
});

Then("visualizo uma mensagem de erro", (tabela) => {
    var mensagem = tabela.rowsHash();
    cy.visualizarMensagem(mensagem.mensagem);
});

Then("visualizo uma mensagem de sucesso", (tabela) => {
    var mensagem = tabela.rowsHash();
    cy.visualizarMensagem(mensagem.mensagem);
});

When("preencho o campo E-mail com um E-mail já utilizado", (tabela) => {
    var email = tabela.rowsHash();
    perfil_Page.atualizarEmail(email)
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