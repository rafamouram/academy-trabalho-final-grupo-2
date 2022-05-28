import { perfil_Page } from '../pages/perfilPage.po';

import { login_Page } from '../pages/loginPage.po';

import { lista_Page } from '../pages/gestaoListaCompra.po';

import { criarUsuario } from '../pages/criarUsuario.po';

afterEach(() => {
    perfil_Page.deslogarDoSite();
});

Given("que acessei o site Lembra compras", () => {
    criarUsuario.acesso();
});

Given("loguei no site", (tabela) => {
    var usuario = tabela.rowsHash();
    // Cadastrando usuário para efetuar login
    login_Page.acessarTelaCadastrar();
    criarUsuario.cadastrar("Cacadores de API", usuario.email, usuario.senha, usuario.senha);
    criarUsuario.clicarBotaoRegistrar();

    // Efetuando login
    criarUsuario.acesso();
    login_Page.preenchoDadosLogin(usuario);
    //cy.interceptLogin();
    login_Page.clicarBotaoEntrar();
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

When("preencho o campo nome com apenas espaço", (tabela) => {
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