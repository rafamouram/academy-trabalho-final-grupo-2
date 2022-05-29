import{loginPage} from "../pages/login.po"
	
	Given("acessei o site Lembra Compras", () => {
		loginPage.acessarPagina();
		// loginPage.textoPagina();
		// loginPage.textoPagina2();
		// loginPage.textoNaJanela();
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






