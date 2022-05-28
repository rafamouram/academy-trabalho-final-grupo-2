class loginPage {
    inputEmail = "[name='email']";
    inputSenha = "[name='password']";

    preenchoDadosLogin(tabela) {
        cy.get(this.inputEmail).type(tabela.email);
        cy.get(this.inputSenha).type(tabela.senha);
    }

    clicarBotaoEntrar() {
        cy.contains("Entrar").click();
    }

    acessarTelaCadastrar() {
        cy.contains("Registre-se").click();
    }
}

export var login_Page = new loginPage();