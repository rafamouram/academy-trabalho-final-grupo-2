class LoginPage {
    inputEmail = "input[name='email']"
    inputSenha = "input[name='password']"
    botaoEntrar = "button"
    linkRegistrar = ".sc-crXcEl "

        acessarPagina () {
            cy.visit("");
        }

        visualizarMensagem (mensagem) {
            cy.contains(mensagem).should("be.visible");
        }

        preencherEmail (email) {
            cy.get(this.inputEmail).type(email);
        }

        preencherSenha (senha) {
            cy.get(this.inputSenha).type(senha);
        }

        clicarEntrar () {
            cy.get(this.botaoEntrar).click();
        }

        clicarRegistar () {
            cy.get(this.linkRegistrar).click();
        }

        textoPagina () {
            cy.get(this.textoTelaInicial).should("be.visible");
        }

        textoPagina2 () {
            cy.contains(this.textoTelaInicial2).should("be.visible");
        }

        textoNaJanela () {
            cy.contains(this.textoJanela).should("be.visible");
        }

        redirecionadoPagina() {
            cy.url().should("be.equal", "https://academy-lembra-compras.herokuapp.com/lista")
        }
}

export var loginPage = new LoginPage();