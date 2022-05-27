class loginPage {
    inputEmail = ("input[type='email']")
    inputSenha = ("input[type='password']")
    botaoEntrar = ("button", 'Entrar')
    linkRegistrar = ("a", 'Registre-se')
    textoTelaInicial = ("p", 'Cansou de esquecer o que você iria comprar ?')
    textoTelaInicial2 = ("h1", 'Entre e saiba mais')
    textoJanela = ("title", 'Lembra Compras')

        acessarPagina () {
            cy.visit("https://academy-lembra-compras.herokuapp.com/login");
        }

        visualizarMensagem (mensagem) {
            cy.contains(mensagem).should("be.visible");
        }

        preencherEmail () {
            cy.get(this.inputNome).type(email);
        }

        preencherSenha () {
            cy.get(this.inputSenha).type(senha);
        }

        clicarEntrar () {
            cy.get(this.botaoEntrar).click();
        }

        clicarRegistar () {
            cy.get(this.linkRegistrar).click();
        }

        textoPagina () {
            cy.contains(this.textoTelaInicial).should("be.visible");
        }

        textoPagina2 () {
            cy.contains(this.textoTelaInicial2).should("be.visible");
        }

        textoNaJanela () {
            cy.contains(this.textoJanela).should("be.visible");
        }
}