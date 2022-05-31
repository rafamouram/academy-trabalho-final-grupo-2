import { loginPage } from "../pages/login.po"
import { criarUsuario } from "../pages/criarUsuario.po"

Given("que acessei o site Lembra Compras", () => {
    loginPage.acessarPagina();

});

When("tento fazer login sem preencher os dados e-mail e senha", () => {
    loginPage.clicarEntrar();
});

Then("visualizo uma mensagem de erro", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.visualizarMensagem(dadosTabela.mensagem);
});


When("informo uma senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherSenha(dadosTabela.senha);
    loginPage.clicarEntrar();
});


When("informo um e-mail", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherEmail(dadosTabela.email);
    loginPage.clicarEntrar();
});


When("informo um e-mail e senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherEmail(dadosTabela.email);
    loginPage.preencherSenha(dadosTabela.senha);
    loginPage.clicarEntrar();
});


Then("sou autentificado e tenho acesso às demais funcionalidades do site", () => {
    loginPage.redirecionadoPagina();
});

When("informo um e-mail e senha não correspondentes", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherEmail(dadosTabela.email);
    loginPage.preencherSenha(dadosTabela.senha);
    loginPage.clicarEntrar();
});


When("informo um e-mail inexistente e senha", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    loginPage.preencherEmail(dadosTabela.email);
    loginPage.preencherSenha(dadosTabela.senha);
    loginPage.clicarEntrar();
});

When("informo um e-mail e senha válidos", (tabela) => {
    var dadosTabela = tabela.rowsHash();
    var email = dadosTabela.email;
    var nome = "Cacadores de API";
    var senha = dadosTabela.senha;
    // Cadastrando usuário para efetuar login
    loginPage.acessarTelaCadastrar();
    criarUsuario.preencherCampos(nome, email, senha, senha);
    criarUsuario.clicarBotaoRegistrar();
    loginPage.acessarPagina();
    loginPage.preencherEmail(dadosTabela.email);
    loginPage.preencherSenha(dadosTabela.senha);
    loginPage.clicarEntrar();
});