import { gestaoListaDeCompras } from "../pages/gestaoListaCompra.po"
import { login_Page } from "../pages/loginPage.po"
import { criarUsuario } from "../pages/criarUsuario.po"

// afterEach(() => {
//     gestaoListaDeCompras.deslogarDoSite();
// });

 Given("que acessei o site Lembra Compras", () => {
    gestaoListaDeCompras.visitarPagina();

});    


Given("loguei com um usuário", (tabela) => {
    var usuario = tabela.rowsHash();
    // Cadastrando usuário para efetuar login
    login_Page.acessarTelaCadastrar();
    criarUsuario.cadastrar("Cacadores de API", usuario.email, usuario.senha, usuario.senha);
    criarUsuario.clicarBotaoRegistrar();
    criarUsuario.acesso();

    // Efetuando login
    login_Page.preenchoDadosLogin(usuario);
    
    login_Page.clicarBotaoEntrar();
    //cy.inteceptListaVazia();
});

When("preencho a descrição da lista de compras", (tabela) => {
	var descricaoLista = tabela.rowsHash();
    gestaoListaDeCompras.preencherNomeDaLista(descricaoLista.descricao);
    
});

When("incluo uma lista de itens na lista de compras", (tabela) => {
    var nomeItem = tabela.hashes();
    nomeItem.forEach(element => {
        gestaoListaDeCompras.preencherNomeDoItem(element.nome);
        gestaoListaDeCompras.preencherQuantidadeDoItem(element.quantidade);
        gestaoListaDeCompras.clicarAdicionarItem();  
    });
    gestaoListaDeCompras.clicarBotaoSalvar();
        
});

When("possuo uma lista de compras salva", () => {
    cy.interceptLista();
    gestaoListaDeCompras.riscarItemNaLista();
});

When("salvo a lista de compras sem incluir itens", () => {
    gestaoListaDeCompras.clicarBotaoSalvar();   
});

When("marco o item como concluído na lista de compra", () => {
	
});

When("finalizo a lista de compra", () => {
    
});

When('incluo um item na lista de compras', (tabela) => {
    var nomeItem = tabela.rowsHash();
    gestaoListaDeCompras.preencherNomeDoItem(nomeItem.nome);
    gestaoListaDeCompras.preencherQuantidadeDoItem(nomeItem.quantidade);
    gestaoListaDeCompras.clicarAdicionarItem();
});

Then("visualizo a mensagem de sucesso", (tabela) => {
    var listaCriadaSucesso = tabela.rowsHash(); 
    gestaoListaDeCompras.mensagemListaCriadaComSucesso(listaCriadaSucesso.mensagem);
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarLista();
    gestaoListaDeCompras.deslogarDoSite();
});

Then("visualizo a opção de marcar um item como concluído", () => {
	gestaoListaDeCompras.riscarItemNaLista();
});

Then("visualizo a opção de incluir um novo item", () => {
    gestaoListaDeCompras.botaoAdicionarItem();
});

Then("visualizo a opção de finalizar a lista", () => {
    gestaoListaDeCompras.botaoFinalizarLista();
    gestaoListaDeCompras.clicarFinalizarLista();
    gestaoListaDeCompras.confirmarFinalizarLista();
    gestaoListaDeCompras.deslogarDoSite();
});

Then("visualizo a mensagem de erro", (tabela) => {
    var erroMensagem = tabela.rowsHash();
    gestaoListaDeCompras.mensagemDeErro(erroMensagem.mensagem);
    gestaoListaDeCompras.deslogarDoSite();
});

Then("é acrescentada na quantidade do item já incluso anteriormente a lista de compras ativa", () => {
    cy.interceptAddItem();
    gestaoListaDeCompras.quantidadeDoItem();
});

Then("visualizo o item marcado com um risco cortando o seu nome", () => {
    gestaoListaDeCompras.riscarItemNaLista();
});




