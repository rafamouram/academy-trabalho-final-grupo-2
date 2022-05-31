import { gestaoListaDeCompras } from "../pages/gestaoListaCompra.po"
import { login_Page } from "../pages/loginPage.po"
import { criarUsuario } from "../pages/criarUsuario.po"

const {
    Before,
    After,
  } = require("cypress-cucumber-preprocessor/steps");

Before({ tags: "@logarSite" }, () => {
    criarUsuario.acesso();
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

After({ tags: "@deslogarSite" },() => {
    gestaoListaDeCompras.deslogarDoSite();
});

Given("acessei o site Lembra Compras", () => { 
});    

Given("loguei com um usuário", () => {
});    

When("preencho a descrição da lista de compras", (tabela) => {
	var descricaoLista = tabela.rowsHash();
    gestaoListaDeCompras.preencherNomeDaLista(descricaoLista.descricao); 
});

When("incluo uma lista de itens na lista de compras", (tabela) => {
    var nomeItem = tabela.rowsHash();
    gestaoListaDeCompras.preencherNomeDoItem(nomeItem.nome);
    gestaoListaDeCompras.preencherQuantidadeDoItem(nomeItem.quantidade); 
    gestaoListaDeCompras.clicarAdicionarItem();   
});

When("salvo a lista de compras", () => {
    gestaoListaDeCompras.clicarBotaoSalvar();       
});

When("marco o item como concluído na lista de compra", () => {
    gestaoListaDeCompras.marcarItemNaLista();    
});

When('incluo um item na lista de compras', (tabela) => {
    cy.wait(3000);
    var nomeItem = tabela.rowsHash();
    gestaoListaDeCompras.preencherNomeDoItem(nomeItem.nome);
    gestaoListaDeCompras.preencherQuantidadeDoItem(nomeItem.quantidade);
    gestaoListaDeCompras.clicarAdicionarItem();
});

Then("visualizo a mensagem de sucesso", (tabela) => {
    var listaCriadaSucesso = tabela.rowsHash(); 
    gestaoListaDeCompras.mensagemListaCriadaComSucesso(listaCriadaSucesso.mensagem);
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarNoFim();  
});

Then("visualizo a opção de marcar um item como concluído", () => {
	cy.wait(1000);
    gestaoListaDeCompras.riscarItemNaLista();
});

Then("visualizo a opção de incluir um novo item", () => {
    gestaoListaDeCompras.botaoAdicionarItem();
});

Then("visualizo a opção de finalizar a lista", () => {
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarNoFim(); 
});

Then("visualizo a mensagem de erro", (tabela) => {
    var erroMensagem = tabela.rowsHash();
    gestaoListaDeCompras.mensagemDeErro(erroMensagem.mensagem);
    gestaoListaDeCompras.clicarBotaoSalvar();
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarNoFim(); 
});

Then('visualizo a mensagem de erro na lista', (tabela) => {
    var erroMensagem = tabela.rowsHash();
    gestaoListaDeCompras.mensagemDeErro(erroMensagem.mensagem);
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarNoFim();  
});

Then("visualizo uma mensagem de erro", (tabela) => {
    var erroMensagem = tabela.rowsHash();
    gestaoListaDeCompras.mensagemDeErro(erroMensagem.mensagem); 	
});

Then('finalizo a lista de compras', () => {
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarNoFim();
});

Then("é acrescentada na quantidade do item já incluso anteriormente a lista de compras ativa", () => {
    gestaoListaDeCompras.quantidadeDoItem();
});

Then("visualizo o item marcado com um risco cortando o seu nome", () => {
    gestaoListaDeCompras.riscarItemNaLista();
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarNoFim();
});

Then("visualizo uma mensagem de sucesso", (tabela) => {
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarLista();
    var listaCriadaSucesso = tabela.rowsHash(); 
    gestaoListaDeCompras.mensagemListaCriadaComSucesso(listaCriadaSucesso.mensagem);
});



